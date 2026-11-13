import 'package:material_ui/material_ui.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.name, this.onRemove});

  final String name;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.shopping_bag_outlined),
      title: Text(name),
      trailing: onRemove == null
          ? null
          : IconButton(icon: const Icon(Icons.close), onPressed: onRemove),
    );
  }
}
