import 'package:designpatterns/controllers/signup.controller.dart';
import 'package:designpatterns/repositories/database.repositories.dart';
import 'package:designpatterns/stores/app.store.dart';
import 'package:designpatterns/stores/signup.store.dart';
import 'package:designpatterns/view-models/signup.viewmodel.dart';
import 'package:designpatterns/views/home.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawer.view.dart';

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty!' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty!' : null;
  }
}

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final DatabaseConfiguration _db = new DatabaseConfiguration();

  final _formKey = GlobalKey<FormState>();
  final _controller = new SignUpController();

  var model = new SignUpViewModel();

  bool _saveData = true;

  @override
  Widget build(context) {
    var appStore = Provider.of<AppStore>(context);
    var signUpStore = Provider.of<SignUpStore>(context);

    List<String> options = ["237", "238", "239"];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add new contact",
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insert your name';
                  }
                  return null;
                },
                onSaved: (val) {
                  model.name = val;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                validator: EmailFieldValidator.validate,
                onSaved: (val) {
                  model.email = val;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                validator: PasswordFieldValidator.validate,
                onSaved: (val) {
                  model.password = val;
                },
              ),
              Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 16.0, bottom: 0),
                  child: Text("Choose an icon", textAlign: TextAlign.center)),
              Flex(
                  direction: Axis.horizontal,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(options.length, (index) {
                    return _selectIcon(
                        option: options[index],
                        imagePath:
                            "https://picsum.photos/id/${options[index]}/200/200",
                        changeIcon: () {
                          model.iconOption = options[index];
                          signUpStore.setIcon(options[index]);
                        },
                        currentSelected: signUpStore.iconSelected);
                  })),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Checkbox(
                    activeColor: Colors.blueAccent,
                    value: _saveData,
                    onChanged: (value) {
                      setState(() {
                        _saveData = value;
                      });
                    }),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _saveData == true
                            ? _saveData = false
                            : _saveData = true;
                      });
                    },
                    child: Text("Remember data?"))
              ]),
              SizedBox(
                height: 10,
              ),
              model.busy
                  ? Center(
                      child: Container(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                        ),
                      ),
                    )
                  : FlatButton(
                      color: Theme.of(context).primaryColor,
                      child: Text("Register"),
                      onPressed: () {
                        setState(() {
                          model.busy = true;
                        });
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          _controller.create(model).then((data) {
                            appStore.setUser(
                                data.name, data.email, data.iconOption);

                            print(data.toJson().toString());

                            if (_saveData) {
                              _db.save(data);
                            }

                            setState(() {
                              model.busy = false;
                            });

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeView()));
                          });
                        }else{
                          setState(() {
                            model.busy = false;
                          });
                        }
                      },
                    )
            ],
          ),
        ),
      )),
    );
  }

  _selectIcon(
      {String option,
      String imagePath,
      String currentSelected,
      Function changeIcon}) {
    return Expanded(
      flex: 2,
      child: InkWell(
        onTap: () {
          setState(() {
            changeIcon();
          });
        },
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.loose(Size(200, 120)),
              child: Ink.image(
                image: NetworkImage(imagePath),
                child: InkWell(
                  onTap: null,
                ),
              ),
            ),
            currentSelected == option
                ? Divider(color: Colors.teal, thickness: 5, height: 1)
                : Container(height: 0.0, width: 0.0)
          ],
        ),
      ),
    );
  }
}
