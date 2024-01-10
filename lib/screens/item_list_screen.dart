import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/item_model.dart';
import '../provider/item_provider.dart';

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sử dụng Provider để nhận tham chiếu đến ItemProvider
    ItemProvider itemProvider = Provider.of<ItemProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, child) {
          return ListView.builder(
            itemCount: itemProvider.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(itemProvider.items[index].name),
                onTap: () {
                  _editItem(context, itemProvider, index);
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    itemProvider.deleteItem(index);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItem(context, itemProvider);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addItem(BuildContext context, ItemProvider itemProvider) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController itemNameController = TextEditingController();
        return AlertDialog(
          title: Text('Add Item'),
          content: TextField(
            controller: itemNameController,
            decoration: const InputDecoration(labelText: 'Item Name'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String itemName = itemNameController.text.trim();
                if (itemName.isNotEmpty) {
                  itemProvider.addItem(Item(name: itemName));
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _editItem(BuildContext context, ItemProvider itemProvider, int index) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController itemNameController = TextEditingController();
        itemNameController.text = itemProvider.items[index].name;
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: itemNameController,
            decoration: InputDecoration(labelText: 'Item Name'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String editedName = itemNameController.text.trim();
                if (editedName.isNotEmpty) {
                  itemProvider.editItem(index, Item(name: editedName));
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
