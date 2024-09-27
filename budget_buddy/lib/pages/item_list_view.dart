import 'package:budget_buddy/dialogs/add_dialog.dart';
import 'package:budget_buddy/objects/item.dart';
import 'package:budget_buddy/widgets/budget_item.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

typedef ItemsListChangedCallback = Function(Item item);
typedef ItemsListDeletedCallback = Function(Item item);

class ItemListView extends StatefulWidget {
  const ItemListView(
      {super.key,
      required this.items,
      required this.onListChanged,
      required this.onDeleteItem,
      required this.cam});

  final List<Item> items;
  final ItemsListChangedCallback onListChanged;
  final ItemsListDeletedCallback onDeleteItem;
  final CameraDescription cam;

  @override
  State<StatefulWidget> createState() {
    return ItemListViewState();
  }
}

class ItemListViewState extends State<ItemListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget Buddy"),
        centerTitle: true,
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];

          return BudgetItem(
            item: item,
            onDeleteItem: widget.onDeleteItem,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return ItemDialog(
                    onListChanged: widget.onListChanged, cam: widget.cam);
              });

          //temp function. will be replaced when dialog windows are made.
        },
        tooltip: "Add New Item",
        child: const Icon(Icons.add),
      ),
    );
  }
}
