import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {
  private keycloakUrl: string = "http://keycloak.localhost";
  private keycloakRealm: string = 'software-dev-ecosystem-realm';
  private keycloakClientId: string = 'web-app-1-client';

  constructor(private http: HttpClient, private router: Router) {}

  login(username: string, password: string) {
    const tokenEndpoint = `https://${this.keycloakUrl}/realms/${this.keycloakRealm}/protocol/openid-connect/token`;

    const body = new HttpParams()
      .set('client_id', this.keycloakClientId)
      .set('grant_type', 'password')
      .set('username', username)
      .set('password', password);

    this.http.post<any>(tokenEndpoint, body.toString(), {
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    }).subscribe({
      next: (response) => {
        this.handleAuthenticationSuccess(response);
      },
      error: (error) => {
        console.error('Authentication failed:', error);
      }
    });
  }

  private handleAuthenticationSuccess(response: any) {
    sessionStorage.setItem('kc_token', response.access_token);
    sessionStorage.setItem('kc_refresh_token', response.refresh_token);
    // Navigate to the home page
    this.router.navigate(['/home']);
  }

  isLoggedIn(): boolean {
    const token = sessionStorage.getItem('kc_token');
    // Add more logic to check token validity or expiration
    return !!token;
  }

  logout() {
    sessionStorage.removeItem('kc_token');
    sessionStorage.removeItem('kc_refresh_token');
    // Redirect to login page
    this.router.navigate(['/login']);
  }
}
