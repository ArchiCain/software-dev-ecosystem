import { Injectable } from '@nestjs/common';

@Injectable()
export class SecondEndpointService {
  getHello(): string {
    return 'Hello from the second endpoint!';
  }
}
