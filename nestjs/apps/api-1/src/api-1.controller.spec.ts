import { Test, TestingModule } from '@nestjs/testing';
import { Api1Controller } from './api-1.controller';
import { Api1Service } from './api-1.service';

describe('Api1Controller', () => {
  let api1Controller: Api1Controller;

  beforeEach(async () => {
    const app: TestingModule = await Test.createTestingModule({
      controllers: [Api1Controller],
      providers: [Api1Service],
    }).compile();

    api1Controller = app.get<Api1Controller>(Api1Controller);
  });

  describe('root', () => {
    it('should return "Hello World!"', () => {
      expect(api1Controller.getHello()).toBe('Hello World!');
    });
  });
});
