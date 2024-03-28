import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_company_profile_store.g.dart';

class FormCompanyProfileStore = _FormCompanyProfileStore
    with _$FormCompanyProfileStore;

abstract class _FormCompanyProfileStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  _FormCompanyProfileStore(this.formErrorStore, this.errorStore) {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => companyName, validateCompanyName),
      reaction((_) => website, validateWebsite),
      reaction((_) => description, validateDescription)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String companyName = '';

  @observable
  String website = '';

  @observable
  String description = '';

  // actions:-------------------------------------------------------------------
  @action
  void setCompanyName(String value) {
    companyName = value;
  }

  @action
  void setWebsite(String value) {
    website = value;
  }

  @action
  void setDescription(String value) {
    description = value;
  }

  @action
  void validateCompanyName(String value) {
    if (value.isEmpty) {
      formErrorStore.companyName = "Company name can't be empty";
    } else {
      formErrorStore.companyName = null;
    }
  }

  @action
  void validateWebsite(String value) {
    if (value.isEmpty) {
      formErrorStore.website = "Website can't be empty";
    } else if (!isURL(value)) {
      formErrorStore.website = "Website must be a valid URL";
    } else {
      formErrorStore.website = null;
    }
  }

  @action
  void validateDescription(String value) {
    formErrorStore.description = null;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateCompanyName(companyName);
    validateWebsite(website);
    validateDescription(description);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? companyName;

  @observable
  String? website;

  @observable
  String? description;
}
