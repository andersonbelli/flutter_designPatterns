import 'package:designpatterns/stores/app.store.dart';
import 'package:designpatterns/views/drawer.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts list",
          textAlign: TextAlign.center,
        ),
      ),
      drawer: Drawer(child: DrawerContent()),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(store.picture),
            Text(store.name),
            Text(store.email),
          ],
        ),
      ),
    );
  }
}
