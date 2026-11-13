/// An item in the merchant's catalog.
class Product {
  const Product({
    required this.id,
    required this.name,
    required this.priceInCents,
  });

  final String id;
  final String name;
  final int priceInCents;

  /// e.g. `14.50`.
  String get price => formatCents(priceInCents);

  static String formatCents(int cents) => (cents / 100).toStringAsFixed(2);

  /// The single merchant's catalog.
  /// TODO: replace with a `fetchCatalog` GraphQL query once the schema has one.
  static const List<Product> catalog = [
    Product(id: 'sourdough', name: 'Sourdough loaf', priceInCents: 650),
    Product(id: 'eggs', name: 'Free-range eggs (6)', priceInCents: 480),
    Product(id: 'oat-milk', name: 'Oat milk', priceInCents: 320),
    Product(id: 'pizza', name: 'Margherita pizza', priceInCents: 1590),
    Product(id: 'tiramisu', name: 'Tiramisu', priceInCents: 800),
    Product(id: 'avocado', name: 'Avocado', priceInCents: 250),
    Product(id: 'limes', name: 'Limes (4)', priceInCents: 300),
    Product(id: 'chips', name: 'Tortilla chips', priceInCents: 375),
    Product(id: 'salsa', name: 'Salsa', priceInCents: 425),
  ];

  static Product? byId(String id) {
    for (final p in catalog) {
      if (p.id == id) return p;
    }
    return null;
  }
}
