import { Controller, Get } from '@nestjs/common';
import { Api1Service } from './api-1.service';

@Controller()
export class Api1Controller {
  constructor(private readonly api1Service: Api1Service) {}

  @Get()
  getHello(): string {
    return this.api1Service.getHello();
  }
}
