import { Body, Controller, Post, Res, UnauthorizedException, Get, Req } from '@nestjs/common';
import { Response, Request } from 'express';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly service: AppService) {}

  @Post('login')
  async login(@Body() loginDto: { username: string; password: string }, @Res() res: Response) {
    try {
      const tokens = await this.service.login(loginDto.username, loginDto.password);

      // Set HTTP-only cookie with the access token
      res.cookie('access_token', tokens.access_token, {
        httpOnly: true,
        secure: true, // Secure should be true only in production
        sameSite: 'none', // Ensure SameSite is set to 'none' for cross-site cookies
        // domain: 'web-app-1.localhost', // Use only the domain name without protocol
        path: '/', // Ensure it applies to all paths
      });

      return res.send({ message: 'Logged in successfully' });
    } catch (error) {
      throw new UnauthorizedException('Invalid username or password');
    }
  }

  @Get('validate')
  async validate(@Req() req: Request) {
    try {
      await this.service.validateToken(req);
      return { message: 'Token is valid' };
    } catch (error) {
      console.log('From controller: ', error);
      throw new UnauthorizedException('Invalid or expired token');
    }
  }
}