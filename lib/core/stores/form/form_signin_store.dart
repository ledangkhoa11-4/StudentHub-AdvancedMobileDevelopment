import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_signin_store.g.dart';

class FormSigninStore = _FormSigninStore
    with _$FormSigninStore;

abstract class _FormSigninStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  _FormSigninStore(this.formErrorStore, this.errorStore) {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => fullname, validateFullname),
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String fullname = '';

  @observable
  String email = '';

  @observable
  String password = '';

  // actions:-------------------------------------------------------------------
  @action
  void setFullname(String value) {
    fullname = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void validateFullname(String value) {
    if (value.isEmpty) {
      formErrorStore.fullname = "Fullname can't be empty";
    } else {
      formErrorStore.fullname = null;
    }
  }

  @action
  void validateEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.email = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.email = "Invalid email";
    } else {
      formErrorStore.email = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      formErrorStore.password = "Password can't be empty";
    } else if (!DeviceUtils.validatePassword(value)) {
      formErrorStore.password = "Password length at least 8 characters, one number, one letter and a special one";
    } else {
      formErrorStore.password = null;
    }
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateFullname(fullname);
    validateEmail(email);
    validatePassword(password);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? fullname;

  @observable
  String? email;

  @observable
  String? password;
}
