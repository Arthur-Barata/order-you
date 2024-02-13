export abstract class DatasourcePort<U, T> {
  abstract create(data: U): T;
}
