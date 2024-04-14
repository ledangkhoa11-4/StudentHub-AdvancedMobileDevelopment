import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_post_project_store.g.dart';

class FormPostProjectStore = _FormPostProjectStore with _$FormPostProjectStore;

abstract class _FormPostProjectStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  _FormPostProjectStore(this.formErrorStore, this.errorStore) {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => title, validateTitle),
      reaction((_) => duration, validateDuration),
      reaction((_) => numberOfStudents, validateNumberStudents),
      reaction((_) => description, validateDescription)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  int companyId = 1;

  @observable
  int projectScopeFlag = 1;

  @observable
  int typeFlag = 1;

  @observable
  String title = '';

  @observable
  String duration = '';

  @observable
  int numberOfStudents = 0;

  @observable
  String description = '';

  // actions:-------------------------------------------------------------------
  @action
  void setTitle(String value) {
    title = value;
  }

  @action
  void setDuration(String value) {
    duration = value;
  }

  @action
  void setNumberStudents(int value) {
    numberOfStudents = value;
  }

  @action
  void setDescription(String value) {
    description = value;
  }

  @action
  void validateTitle(String value) {
    if (value.isEmpty) {
      formErrorStore.title = "Project's title can't be empty";
    } else {
      formErrorStore.title = null;
    }
  }

  @action
  void validateDuration(String value) {
    if (value.isEmpty) {
      formErrorStore.duration = "Please tell us project's duration";
    } else {
      formErrorStore.duration = null;
    }
  }

  @action
  void validateNumberStudents(int value) {
    if (value <= 0) {
      formErrorStore.numberStudents = "Please enter a number of students";
    } else {
      formErrorStore.numberStudents = null;
    }
  }

  @action
  void validateDescription(String value) {
    if (value.isEmpty) {
      formErrorStore.description = "Please enter description";
    } else {
      formErrorStore.description = null;
    }
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateTitle(title);
    validateDuration(duration);
    validateNumberStudents(numberOfStudents);
    validateDescription(description);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? title;

  @observable
  String? duration;

  @observable
  String? numberStudents;

  @observable
  String? description;
}
