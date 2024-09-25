import { NestFactory } from '@nestjs/core';
import { Api2Module } from './api-2.module';

async function bootstrap() {
  const app = await NestFactory.create(Api2Module);
  app.setGlobalPrefix('api-2');
  app.enableCors();
  await app.listen(3001);
}
bootstrap();
