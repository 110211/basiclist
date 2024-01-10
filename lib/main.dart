import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:basiclist/provider/item_provider.dart';
import 'package:basiclist/screens/item_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MaterialApp(
        title: 'Flutter Item List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ItemListScreen(),
      ),
    );
  }
}
