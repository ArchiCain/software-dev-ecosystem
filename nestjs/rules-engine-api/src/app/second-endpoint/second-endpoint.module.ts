import { Module } from '@nestjs/common';
import { SecondEndpointController } from './second-endpoint.controller';
import { SecondEndpointService } from './second-endpoint.service';

@Module({
  controllers: [SecondEndpointController],
  providers: [SecondEndpointService]
})
export class SecondEndpointModule {}
