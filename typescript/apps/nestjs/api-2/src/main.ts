import { NestFactory } from '@nestjs/core';

import { AppModule } from './app/app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const globalPrefix = 'api-2';
  app.setGlobalPrefix(globalPrefix);
  app.enableCors({
    origin: ['https://web-app-1.localhost', 'https://web-app-2.localhost'],
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS',
    allowedHeaders: 'Authorization, Content-Type',
    credentials: true,
  });
  const port = process.env.PORT || 3001;
  await app.listen(port);
}

bootstrap();