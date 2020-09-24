import 'package:mobx/mobx.dart';

//  Para gerar o esse arquivo, executar no cmd:
//  flutter packages pub run build_runner clean
//  flutter packages pub run build_runner build
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store{
  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String iconOption = "https://placehold.it/200";

  @action
  void setUser(
    String pName,
    String pEmail,
    String pPicture
  ) {
    name = pName;
    email = pEmail;
    iconOption = pPicture;
  }
}
