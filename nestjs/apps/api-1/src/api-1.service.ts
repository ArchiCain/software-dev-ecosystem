import { Injectable } from '@nestjs/common';

@Injectable()
export class Api1Service {
  getHello(): string {
    return 'Hello World from API 1!';
  }
}
