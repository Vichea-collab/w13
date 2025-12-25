import 'package:flutter/material.dart';
import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';
import '../../ui/groceries/tabs/grocery_search.dart';
import '../../ui/groceries/tabs/grocery_store.dart';
import 'grocery_form.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  int _currentIndex = 0;

  void onCreate() async {
    // Navigate to the form screen using the Navigator push
    Grocery? newGrocery = await Navigator.push<Grocery>(
      context,
      MaterialPageRoute(builder: (context) => const GroceryForm()),
    );
    if (newGrocery != null) {
      setState(() {
        dummyGroceryItems.add(newGrocery);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      GroceryStoreTab(
        groceries: dummyGroceryItems,
        onAdd: onCreate,
      ),
      GrocerySearchTab(
        groceries: dummyGroceryItems,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0 ? 'Your Groceries' : 'Search Groceries',
        ),
        actions: _currentIndex == 0
            ? [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))]
            : null,
      ),
      body: IndexedStack(index: _currentIndex, children: tabs),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            label: 'Groceries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
