import { Module } from '@nestjs/common';
import { Api2Controller } from './api-2.controller';
import { Api2Service } from './api-2.service';

@Module({
  imports: [],
  controllers: [Api2Controller],
  providers: [Api2Service],
})
export class Api2Module {}
