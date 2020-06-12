import 'package:designpatterns/models/user.model.dart';
import 'package:designpatterns/repositories/account.repository.dart';
import 'package:designpatterns/view-models/signup.viewmodel.dart';

class SignupController {
  AccountRepository repository;

  SignupController() {
    repository = new AccountRepository();
  }

  Future<UserModel> create(SignupViewModel model) async {
    model.busy = true;

    var user = await repository.createAccount(model);

    model.busy = false;
    return user;
  }
}
