import 'package:designpatterns/controllers/signup.controller.dart';
import 'package:designpatterns/stores/app.store.dart';
import 'package:designpatterns/view-models/signup.viewmodel.dart';
import 'package:designpatterns/views/home.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email não pode ficar vazio!' : null;
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
  final _formKey = GlobalKey<FormState>();
  final _controller = new SignUpController();

  var model = new SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text("Register"),
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
              Container(width: double.maxFinite, child: Text("Choose an icon")),
              ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Ink.image(image: AssetImage("https://picsum.photos/200/200")),
                  Ink.image(image: AssetImage("https://picsum.photos/200/200")),
                  Ink.image(image: AssetImage("https://picsum.photos/200/200"))
                ],
              ),
              SizedBox(
                height: 20,
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
                      child: Text("Cadastrar"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                        }

                        setState(() {});

                        _controller.create(model).then((data) {
                          setState(() {});

//                          store.setUser(
//                              data.name, data.email, data.picture, data.token);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeView()));
                        });
                      },
                    )
            ],
          ),
        ),
      )),
    );
  }
}
