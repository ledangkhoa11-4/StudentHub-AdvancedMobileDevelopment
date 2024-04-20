import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_changepass_store.g.dart';

class FormChangeStore = _FormChangeStore with _$FormChangeStore;

abstract class _FormChangeStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  _FormChangeStore(this.formErrorStore, this.errorStore) {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => password, validatePassword),
      reaction((_) => NewPassword, validateNewPassword)
    ];
  }

  // store variables:-----------------------------------------------------------


  @observable
  String password = '';

  @observable
  String NewPassword = '';

  @observable
  bool success = false;

  @computed
  bool get canLogin =>
      !formErrorStore.hasErrorsInpassword &&
      password.isNotEmpty;

  @computed
  bool get canRegister =>
      !formErrorStore.hasErrorsInnewpassword &&
      password.isNotEmpty &&
      NewPassword.isNotEmpty;



  // actions:-------------------------------------------------------------------
  @action


  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setNewPassword(String value) {
    NewPassword = value;
  }


  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      formErrorStore.password = "Password can't be empty";
    } else if (!DeviceUtils.validatePassword(value)) {
      formErrorStore.password =
          "Password length at least 8 characters, one number, one letter and a special one";
    } else {
      formErrorStore.password = null;
    }
  }

  @action
  void validateNewPassword(String value) {
    if (value.isEmpty) {
      formErrorStore.NewPassword = "New password can't be empty";
    } else if (!DeviceUtils.validatePassword(value)) {
      formErrorStore.NewPassword =
          "New password length at least 8 characters, one number, one letter and a special one";
    } else {
      formErrorStore.NewPassword = null;
    }
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateNewPassword(NewPassword);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {

  @observable
  String? password;

  @observable
  String? NewPassword;

  @computed
  bool get hasErrorsInpassword => password != null;

  @computed
  bool get hasErrorsInnewpassword =>
       NewPassword != null;

}
