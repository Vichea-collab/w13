import 'package:flutter/material.dart';

import '../../../models/grocery.dart';
import '../widgets/grocery_tile.dart';
class GrocerySearchTab extends StatefulWidget {
  const GrocerySearchTab({super.key, required this.groceries});

  final List<Grocery> groceries;

  @override
  State<GrocerySearchTab> createState() => _GrocerySearchTabState();
}

class _GrocerySearchTabState extends State<GrocerySearchTab> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = widget.groceries
        .where(
          (grocery) => grocery.name.toLowerCase().contains(_query.toLowerCase()),
        )
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: 'Search groceries',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => setState(() {
              _query = value;
            }),
          ),
        ),
        Expanded(
          child: filtered.isEmpty
              ? const Center(child: Text('No groceries match your search.'))
              : ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) =>
                      GroceryTile(grocery: filtered[index]),
                ),
        ),
      ],
    );
  }
}
