import 'package:designpatterns/controllers/signup.controller.dart';
import 'package:designpatterns/stores/app.store.dart';
import 'package:designpatterns/view-models/signup.viewmodel.dart';
import 'package:designpatterns/views/home.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = new SignupController();

  var model = new SignupViewModel();

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
              Text("Cadastre-se"),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira seu nome';
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira seu email';
                  }
                  return null;
                },
                onSaved: (val) {
                  model.email = val;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira uma senha';
                  }
                  return null;
                },
                onSaved: (val) {
                  model.password = val;
                },
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
                          print(data.token);
                          setState(() {});

                          store.setUser(
                              data.name, data.email, data.picture, data.token);

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
