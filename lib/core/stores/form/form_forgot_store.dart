import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_forgot_store.g.dart';

class FormForgotStore = _FormForgotStore with _$FormForgotStore;

abstract class _FormForgotStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  _FormForgotStore(this.formErrorStore, this.errorStore) {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userEmail, validateUserEmail),
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String userEmail = '';


  @observable
  bool success = false;

  @computed
  bool get canForgetPassword => userEmail.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUserId(String value) {
    userEmail = value;
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.userEmail = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.userEmail = 'Please enter a valid email address';
    } else {
      formErrorStore.userEmail = null;
    }
  }


  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateUserEmail(userEmail);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? userEmail;


  @computed
  bool get hasErrorsInLogin => userEmail != null ;
}
