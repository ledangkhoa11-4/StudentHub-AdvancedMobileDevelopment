import 'dart:convert';

import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/core/stores/form/form_store.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/usecase/user/create_update_company_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/get_me_usecase.dart';
import 'package:boilerplate/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_auth_token_usercase.dart';
import 'package:boilerplate/domain/usecase/user/save_current_profile_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_login_in_status_usecase.dart';
import 'package:boilerplate/domain/usecase/user/signup_usecase.dart';
import 'package:boilerplate/domain/usecase/user/forgot_usecase.dart';
import 'package:boilerplate/domain/usecase/user/change_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entity/user/user.dart';
import '../../../domain/usecase/user/login_usecase.dart';

part 'login_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // constructor:---------------------------------------------------------------
  _UserStore(
      this._isLoggedInUseCase,
      this._saveLoginStatusUseCase,
      this._saveAuthTokenUseCase,
      this._saveCurrentProfileUseCase,
      this._loginUseCase,
      this._changeUseCase,
      this._forgotUseCase,
      this._signupUseCase,
      this.formErrorStore,
      this.errorStore,
      this._getMeUseCase,
      this._createCompanyProfileUseCase) {
    // setting up disposers
    _setupDisposers();

    // checking if user is logged in
    _isLoggedInUseCase.call(params: null).then((value) async {
      isLoggedIn = value;
    });
  }

  // use cases:-----------------------------------------------------------------
  final IsLoggedInUseCase _isLoggedInUseCase;
  final SaveLoginStatusUseCase _saveLoginStatusUseCase;
  final SaveAuthTokenUseCase _saveAuthTokenUseCase;
  final SaveCurrentProfileUseCase _saveCurrentProfileUseCase;
  final LoginUseCase _loginUseCase;
  final ChangeUseCase _changeUseCase;
  final ForgotUseCase _forgotUseCase;
  final SignupUseCase _signupUseCase;
  final GetMeUseCase _getMeUseCase;
  final CreateUpdateCompanyProfileUseCase _createCompanyProfileUseCase;

  // stores:--------------------------------------------------------------------
  // for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
      reaction((_) => changeSuccess, (_) => changeSuccess = false, delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<User?> emptyLoginResponse =
      ObservableFuture.value(null);

  // store variables:-----------------------------------------------------------
  bool isLoggedIn = false;

  @observable
  User? user = null;

  @observable
  int? currentRole = null;

  @observable
  bool? success = null;

  @observable
  bool? signupSuccess = null;

  @observable
  bool? forgotSuccess = null;
  
  @observable
  bool? changeSuccess = null;

  @observable
  bool? getMeSuccess = null;

  @observable
  String signupMessage = "";

  @observable
  String forgotMessage = "";

  @observable
  String changeMessage = "";

  @observable
  String siginMessage = "";

  @observable
  String apiResponseMessage = "";

  @observable
  bool? apiResponseSuccess = null;

  @observable
  bool? isCreateProfile = null;

  @observable
  ObservableFuture<dynamic> loginFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> signinFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> getMeFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> createCompanyProfileFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> forgotFuture = emptyLoginResponse;
  
  @observable
  ObservableFuture<dynamic> changeFuture = emptyLoginResponse;

  @computed
  bool get isLoading =>
      loginFuture.status == FutureStatus.pending ||
      getMeFuture.status == FutureStatus.pending ||
      createCompanyProfileFuture.status == FutureStatus.pending ||
      forgotFuture.status == FutureStatus.pending ||
      changeFuture.status == FutureStatus.pending;

  @computed
  bool get isSignin => signinFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future login(String email, String password) async {
    final LoginParams loginParams =
        LoginParams(email: email, password: password);
    final future = _loginUseCase.call(params: loginParams);
    loginFuture = ObservableFuture(future);

    await future.then((value) async {
      if (value != null) {
        String message = value.toString();
        final response = jsonDecode(message);
        final token = response["result"]["token"].toString();
        await _saveAuthTokenUseCase.call(params: token);
        await _saveLoginStatusUseCase.call(params: true);
        this.isLoggedIn = true;
        this.success = true;
        this.siginMessage = "";
      }
    }).catchError((e) {
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.isLoggedIn = false;
      this.success = false;
      this.siginMessage = response["errorDetails"].toString();
    });
  }

  @action
  Future signup(String fullname, String email, String password, int role) async {
    final SignupParam signupParam = SignupParam(
        fullname: fullname, email: email, password: password, role: role);
    final future = _signupUseCase.call(params: signupParam);
    signinFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        String message = value.toString();
        final response = jsonDecode(message);
        this.signupMessage = response["result"]["message"].toString();
        this.signupSuccess = true;
      }
    }).catchError((e) {
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.signupSuccess = false;
      this.signupMessage = response["errorDetails"].first.toString();
    });
  }

  @action
  Future forgot(String email) async {
    final ForgotParams signupParam = ForgotParams(email: email);
    final future = _forgotUseCase.call(params: signupParam);
    signinFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        String message = value.toString();
        final response = jsonDecode(message);
        this.forgotMessage = response["result"]["message"].toString();
        this.forgotSuccess = true;
      }
    }).catchError((e) {
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.forgotSuccess = false;
      this.forgotMessage = response["errorDetails"].toString();
    });
  }

  @action
  Future change(String oldPassword, String newPassword) async {
    final ChangeParams changeParam = ChangeParams(oldPassword: oldPassword, newPassword: newPassword);
    final future = _changeUseCase.call(params: changeParam);
    changeFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        this.changeMessage = "Changed Password successfully";
        this.changeSuccess = true;
      }
    }).catchError((e) {
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.changeSuccess = false;
      this.changeMessage = response["errorDetails"].toString();
    });
  }



  @action
  Future getMe() async {
    final GetMeParam getMeParam = GetMeParam();
    final future = _getMeUseCase.call(params: getMeParam);
    getMeFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        final currentProfile = getIt<SharedPreferenceHelper>().currentProfile;
        if (currentProfile == null) {
          getIt<SharedPreferenceHelper>()
              .saveCurrentProfile(value.roles!.first);
        }
        this.user = value;
        this.getMeSuccess = true;
      }
    }).catchError((e) {
      print(e);
    });
  }

  @action
  Future createUpdateCompanyProfile(
      CreateUpdateCompanyProfileParams param) async {
    final future = _createCompanyProfileUseCase.call(params: param);
    createCompanyProfileFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        if (param.uid == null) {
          this.isCreateProfile = true;
          this.getMe();
        }
        this.user!.setCompanyProfile(value);
        this.apiResponseSuccess = true;
      }
    }).catchError((e) {
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
  }

  logout() async {
    this.isLoggedIn = false;
    await _saveLoginStatusUseCase.call(params: false);
    getIt<SharedPreferenceHelper>().removeAuthToken();
    getIt<SharedPreferenceHelper>().removeCurrentProfile();
  }

  resetSigninState() {
    this.signupSuccess = null;
    this.signupMessage = "";
  }

  resetchangeState() {
    this.changeMessage = "";
    this.changeSuccess = null;
  }

  resetLoginState() {
    this.siginMessage = "";
    this.success = null;
  }

  resetGetMeSuccessState() {
    this.getMeSuccess = null;
  }

  resetApiResponse() {
    this.apiResponseMessage = "";
    this.apiResponseSuccess = null;
  }

  resetCreateProfileState() {
    this.isCreateProfile = null;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
