class Environments {
  static const baseURL = String.fromEnvironment(
    'dummyjson',
    defaultValue: 'dummyjson.com',
  );

  static const product = String.fromEnvironment(
    'products',
    defaultValue: '/products',
  );
  static const categories = String.fromEnvironment(
    'categories',
    defaultValue: '/products/categories',
  );
}
