import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { SecondEndpointModule } from './second-endpoint/second-endpoint.module';

@Module({
  imports: [SecondEndpointModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
