import { NestFactory } from '@nestjs/core';
import { AppModule } from './app/app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.setGlobalPrefix('api/rules-engine'); // TODO: set this from k8s configs somehow or global var?
  app.enableCors();
  await app.listen(3000);
}
bootstrap();
