import 'package:designpatterns/stores/app.store.dart';
import 'package:designpatterns/views/signup.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    print("Name: " + store.name.runtimeType.toString());

    return ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: store.name.isEmpty
              ? InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpView()));
                  },
                  child: Text("Click here to register",
                      style: TextStyle(fontSize: 24)))
              : Text(store.name),
          accountEmail: store.email.isEmpty ? null : Text(store.email),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                ? Colors.deepOrangeAccent
                : Theme.of(context).accentColor,
            child: store.name.isEmpty
                ? Icon(Icons.person, size: 55)
                : Text(store.name.substring(0, 1),
                    style: TextStyle(
                        fontSize: 40, color: Theme.of(context).buttonColor)),
          ),
        ),
        ListTile(
          title: Text("Settings"),
          trailing: Icon(Icons.settings),
          onTap: () {
            print("Settings click");
          },
        )
      ],
    );
  }
}
