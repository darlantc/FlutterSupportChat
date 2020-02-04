import 'package:mobx/mobx.dart';
import 'package:flutter_chat/model/user_model.dart';
part 'user_form_model.g.dart';

class UserFormModel = _UserFormModelBase with _$UserFormModel;

abstract class _UserFormModelBase with Store {
  String token;

  _UserFormModelBase(UserModel currentUser) {
    this.token = currentUser.token;

    this.setName(currentUser.name);
    this.setEmail(currentUser.email);
  }

  @observable
  String name;
  @observable
  String email;
  @observable
  String password = "";
  @observable
  String confirmPassword = "";

  @observable
  bool isWaiting = false;

  @action
  setIsWaiting(bool newValue) => this.isWaiting = newValue;
  @action
  setName(String newValue) => this.name = newValue;
  @action
  setEmail(String newValue) => this.email = newValue;
  @action
  setPassword(String newValue) => this.password = newValue;
  @action
  setConfirmPassword(String newValue) => this.confirmPassword = newValue;

  @computed
  String get validateName {
    if (this.name.length < 3) {
      return "Digite pelo menos 3 caracteres";
    }
    return null;
  }
}
