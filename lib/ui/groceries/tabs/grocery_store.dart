import 'package:flutter/material.dart';

import '../../../models/grocery.dart';
import '../widgets/grocery_tile.dart';

class GroceryStoreTab extends StatelessWidget {
  const GroceryStoreTab({
    super.key,
    required this.groceries,
    required this.onAdd,
  });

  final List<Grocery> groceries;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    if (groceries.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('No items added yet.'),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              label: const Text('Add your first item'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: groceries.length,
      itemBuilder: (context, index) => GroceryTile(grocery: groceries[index]),
    );
  }
}
