import { Test, TestingModule } from '@nestjs/testing';
import { SecondEndpointService } from './second-endpoint.service';

describe('SecondEndpointService', () => {
  let service: SecondEndpointService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [SecondEndpointService],
    }).compile();

    service = module.get<SecondEndpointService>(SecondEndpointService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
