import 'package:designpatterns/repositories/database.repositories.dart';
import 'package:designpatterns/views/drawer.view.dart';
import 'package:designpatterns/views/home.view.dart';
import 'package:designpatterns/views/signup.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.model.dart';
import 'stores/app.store.dart';
import 'stores/signup.store.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(MyApp());
//  final DatabaseConfiguration _db = new DatabaseConfiguration();
//
//  String id;
//  String name;
//  String email;
//  String iconOption;
//
//  Uuid uuid = Uuid();
//
//  _db.findAll().then((value) {
//    print("main: " + value.toString());
//  });

//  _db
//      .save(UserModel(
//          id: uuid.v1().toString(),
//          name: "Anddd",
//          email: "email@email.com",
//          password: "123",
//          iconOption: "237"))
//      .then((value) {
//    print("\n\nMainSave: $value");
//  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        Provider<AppStore>.value(value: AppStore()),
        Provider<SignUpStore>.value(value: SignUpStore())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.blue),
        theme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.blue),
        home: HomeView(),
      ),
    );
  }
}
