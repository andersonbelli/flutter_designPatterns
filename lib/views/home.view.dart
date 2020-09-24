import 'package:designpatterns/models/user.model.dart';
import 'package:designpatterns/repositories/database.repositories.dart';
import 'package:designpatterns/stores/app.store.dart';
import 'package:designpatterns/views/drawer.view.dart';
import 'package:designpatterns/views/signup.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(context) {
    var store = Provider.of<AppStore>(context);

    final DatabaseConfiguration _db = new DatabaseConfiguration();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts list",
          textAlign: TextAlign.center,
        ),
      ),
      drawer: Drawer(child: DrawerContent()),
      body: FutureBuilder(
          initialData: List(),
          future: _db.findAll(),
          builder: (context, snapshot) {
            print("agui: " + snapshot.connectionState.toString());

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(child: Text("Loading data ..."));
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.data != null) {
                  final List<UserModel> users = snapshot.data;

                  if (users.length != 0) {
                    return GridView.builder(
                      itemCount: users.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final UserModel user = users[index];
                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: index % 2 == 1
                                  ? Colors.white30
                                  : Colors.indigo[900],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 30,
                          alignment: Alignment.topCenter,
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              Expanded(
                                flex: 4,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  child: Image.network(
                                    "https://picsum.photos/id/${user.iconOption}/200/200",
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(user.name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text(user.email)
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Nothing to see here :(",
                              textAlign: TextAlign.center),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpView()));
                              },
                              child: Text("Click here to add new contacts",
                                  textAlign: TextAlign.center)),
                        ],
                      ),
                    );
                  }
                } else {
                  return Text("Empty >:'(");
                }
                break;
            }
            return Text(":d");
          }),
    );
  }
}
