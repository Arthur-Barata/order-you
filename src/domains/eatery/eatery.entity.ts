export class Eatery {
  id?: string;
  name: string;
  email: string;
  password: string;
  cnpj: string;
  logoImage?: string;
  marketingImage?: string;

  constructor(data: Partial<Eatery>) {
    Object.assign(this, data);
  }
}
