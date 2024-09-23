import { Test, TestingModule } from '@nestjs/testing';
import { SecondEndpointController } from './second-endpoint.controller';

describe('SecondEndpointController', () => {
  let controller: SecondEndpointController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [SecondEndpointController],
    }).compile();

    controller = module.get<SecondEndpointController>(SecondEndpointController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
