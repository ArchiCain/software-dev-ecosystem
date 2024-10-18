import { NestFactory } from '@nestjs/core';
import { AppModule } from './app/app.module';
import cookieParser from 'cookie-parser';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const globalPrefix = 'auth-api';
  app.setGlobalPrefix(globalPrefix);
  app.enableCors({
    origin: ['https://web-app-1.localhost', 'https://web-app-2.localhost'],
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS',
    allowedHeaders: 'Authorization, Content-Type',
    credentials: true,
  });
  const port = process.env.PORT || 3002;
  // Use cookie-parser middleware
  app.use(cookieParser());
  await app.listen(port);
}

bootstrap();