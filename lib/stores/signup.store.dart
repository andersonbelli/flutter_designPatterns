import 'package:mobx/mobx.dart';

//  Para gerar o esse arquivo, executar no cmd:
//  flutter packages pub run build_runner clean
//  flutter packages pub run build_runner build
part 'signup.store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store{
  @observable
  String iconSelected = "237";

  @action
  void setIcon(
    String pIconSelected,
  ) {
    iconSelected = pIconSelected;
  }
}
