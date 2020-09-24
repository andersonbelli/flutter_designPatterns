// Unidade de acesso a dados
import 'package:designpatterns/models/user.model.dart';
import 'package:designpatterns/view-models/signup.viewmodel.dart';
import 'package:uuid/uuid.dart';

class AccountRepository {
  Future<UserModel> createAccount(SignUpViewModel model) async {
    var uuid = Uuid();

    await Future.delayed(new Duration(milliseconds: 1500));
    return new UserModel(
      id: uuid.v1().toString(),
      name: model.name,
      email: model.email,
      password: model.password,
      iconOption: model.iconOption,
    );
  }
}
