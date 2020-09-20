import 'package:designpatterns/views/drawer.view.dart';
import 'package:designpatterns/views/home.view.dart';
import 'package:designpatterns/views/signup.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'stores/app.store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<AppStore>.value(value: AppStore())],
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
