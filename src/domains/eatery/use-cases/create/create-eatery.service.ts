import { Eatery } from "@prisma/client";
import { DatasourcePort } from "../../../../datasource/interfaces/datasource-port";
import { CreateEateryResponseDto } from "../../../../presentation/dtos/eatery/create/response/create-eatery-response.dto";

export class CreateEateryService {
  constructor(
    private readonly eateryRepository: DatasourcePort<
      Eatery,
      CreateEateryResponseDto
    >
  ) {}
  public async execute(data: Eatery) {
    try {
      await this.eateryRepository.create(data);
    } catch (error) {
      console.error(error);
    }
  }
}
