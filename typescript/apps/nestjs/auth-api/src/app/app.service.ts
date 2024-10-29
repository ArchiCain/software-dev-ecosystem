import { Injectable, UnauthorizedException } from '@nestjs/common';
import axios from 'axios';
import * as jwt from 'jsonwebtoken';
import { Request } from 'express';
import jwksClient, { SigningKey } from 'jwks-rsa';
import https from 'https';
import fs from 'fs';
import path from 'path';

@Injectable()
export class AppService {
  private keycloakUrl: string = "https://keycloak:8443";
  private keycloakRealm: string = 'software-dev-ecosystem-realm';

  private keycloakClientId: string = 'web-app-1-client';
  private keycloakSecret: string = 'FIJyg2NJdCQWndWJM87oR6OSFiIosYBY';

  private jwksUri: string = `${this.keycloakUrl}/realms/${this.keycloakRealm}/protocol/openid-connect/certs`;
  private httpsAgent: https.Agent;

  private client: jwksClient.JwksClient;

  constructor() {
    // Create an HTTPS agent with the self-signed certificate handling.
    this.httpsAgent = new https.Agent({
      rejectUnauthorized: false, // Disable certificate validation
    });

    // Create JWKS client using the custom HTTPS agent
    this.client = jwksClient({
      jwksUri: this.jwksUri,
      requestAgent: this.httpsAgent,
    });
  }

  async login(username: string, password: string): Promise<{ access_token: string; refresh_token: string }> {
    try {
      const tokenEndpoint = `${this.keycloakUrl}/realms/${this.keycloakRealm}/protocol/openid-connect/token`;

      const keycloakResponse = await axios.post(
        tokenEndpoint,
        new URLSearchParams({
          client_id: this.keycloakClientId,
          client_secret: this.keycloakSecret,
          grant_type: 'password',
          username,
          password,
        }),
        {
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
          httpsAgent: this.httpsAgent, // Use the HTTPS agent
        }
      );

      return keycloakResponse.data;
    } catch (error) {
      console.log({ error });
      throw new UnauthorizedException('Invalid username or password');
    }
  }

  async validateToken(req: Request): Promise<void> {
    const token = req.cookies['access_token'];

    if (!token) {
      throw new UnauthorizedException('No access token provided');
    }

    try {
      const decodedToken: any = jwt.decode(token, { complete: true });
      if (!decodedToken) {
        throw new UnauthorizedException('Invalid token');
      }

      const kid = decodedToken.header.kid;
      const key = await this.getSigningKey(kid);

      jwt.verify(token, key, (err: any) => {
        if (err) {
          console.log('Verify failed: ', err);
          throw new UnauthorizedException('Invalid or expired token');
        }
      });
    } catch (error) {
      console.error('Token validation failed:', error);
      throw new UnauthorizedException('Invalid or expired token');
    }
  }

  private async getSigningKey(kid: string): Promise<string> {
    return new Promise((resolve, reject) => {
      this.client.getSigningKey(kid, (err, key: SigningKey | undefined) => {
        if (err || !key) {
          return reject(err || new Error('Signing key not found'));
        }
        const signingKey = key.getPublicKey();
        resolve(signingKey);
      });
    });
  }
}
