import { NestFactory } from '@nestjs/core';
import { Api1Module } from './api-1.module';

async function bootstrap() {
  const app = await NestFactory.create(Api1Module);
  app.setGlobalPrefix('api-1');
  app.enableCors();
  await app.listen(3000);
}
bootstrap();
