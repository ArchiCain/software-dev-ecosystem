import { Module } from '@nestjs/common';
import { Api1Controller } from './api-1.controller';
import { Api1Service } from './api-1.service';

@Module({
  imports: [],
  controllers: [Api1Controller],
  providers: [Api1Service],
})
export class Api1Module {}
