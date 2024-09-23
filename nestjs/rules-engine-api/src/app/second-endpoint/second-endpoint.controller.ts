import { Controller, Get } from '@nestjs/common';
import { SecondEndpointService } from './second-endpoint.service';

@Controller('second-endpoint')
export class SecondEndpointController {
  constructor(private readonly service: SecondEndpointService) {}

  @Get()
  getHello(): string {
    return this.service.getHello();
  }
}
