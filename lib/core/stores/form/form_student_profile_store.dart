import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/domain/entity/user/education.dart';
import 'package:boilerplate/domain/entity/user/experience.dart';
import 'package:boilerplate/domain/entity/user/language.dart';
import 'package:boilerplate/domain/entity/user/skillset.dart';
import 'package:boilerplate/domain/entity/user/tech_stack.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_student_profile_store.g.dart';

class FormStudentProfileStore = _FormStudentProfileStore
    with _$FormStudentProfileStore;

abstract class _FormStudentProfileStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  _FormStudentProfileStore(this.formErrorStore, this.errorStore) {
    _setupValidations();
    _initFilesMap();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;
  late ObservableMap<String, Observable<PlatformFile?>> _filesMap;

  void _setupValidations() {
    _disposers = [
      reaction((_) => techStackId, validateTechStackId),
      reaction((_) => skillSets, validateSkillSets),
      reaction((_) => languages, validateLanguages),
      reaction((_) => educations, validateEducations),
      reaction((_) => experiences, validateExperiences),
    ];
  }

  void _initFilesMap() {
    _filesMap = ObservableMap<String, Observable<PlatformFile?>>();

    _filesMap['resume'] = Observable<PlatformFile?>(resume);
    _filesMap['transcript'] = Observable<PlatformFile?>(transcript);

    reaction(
      (_) => _filesMap['resume']!.value,
      (value) => resume = value,
    );
    reaction(
      (_) => _filesMap['transcript']!.value,
      (value) => transcript = value,
    );
  }

  // store variables:-----------------------------------------------------------

  @observable
  int techStackId = -1;

  @observable
  List<int> skillSets = [];

  // @observable
  // ProfileLanguage initLanguage = ProfileLanguage(languageName: "", level: "");

  @observable
  ObservableList<ProfileLanguage?> languages =
      ObservableList<ProfileLanguage?>.of(
          [ProfileLanguage(languageName: "", level: "")]);

  @observable
  ObservableList<Education?> educations = ObservableList<Education?>.of(
      [Education(schoolName: "", startYear: 0, endYear: 0)]);

  @observable
  ObservableList<Experience?> experiences = ObservableList<Experience?>.of([]);

  @observable
  PlatformFile? resume;

  @observable
  PlatformFile? transcript;

  @action
  void setFile(String label, PlatformFile? file) {
    if (_filesMap[label] != null) {
      _filesMap[label]!.value = file;
    }
  }

  Observable<PlatformFile?>? getFileObservable(String label) {
    return _filesMap[label];
  }

  // actions:-------------------------------------------------------------------
  @action
  void setTechStackId(int value) {
    techStackId = value;
  }

  @action
  void setSkillsets(List<int> value) {
    skillSets = value;
  }

  @action
  void setAddLanguage(ProfileLanguage lang) {
    languages.add(lang);
  }

  @action
  void setAddEducation(Education edu) {
    educations.add(edu);
  }

  @action
  void setAddExperience(Experience exp) {
    experiences.add(exp);
  }

  @action
  void setRemoveLanguage(int index) {
    if (index >= 0 && index < languages.length) {
      final _languages =
          ObservableList<ProfileLanguage?>.of(this.languages.toList());
      _languages[index] = null;
      languages = _languages;
    }
  }

  @action
  void setRemoveExperience(int index) {
    if (index >= 0 && index < experiences.length) {
      final _experiences =
          ObservableList<Experience?>.of(this.experiences.toList());
      _experiences[index] = null;
      experiences = _experiences;
    }
  }

  @action
  void setRemoveEducation(int index) {
    if (index >= 0 && index < educations.length) {
      final _educations =
          ObservableList<Education?>.of(this.educations.toList());
      _educations[index] = null;
      educations = _educations;
    }
  }

  @action
  void setLanguageAtIndex(ProfileLanguage lang, int index) {
    if (index >= 0 && index < languages.length) {
      final _languages =
          ObservableList<ProfileLanguage?>.of(this.languages.toList());
      _languages[index] = lang;
      languages = _languages;
    }
  }

  @action
  void setEducationAtIndex(Education edu, int index) {
    if (index >= 0 && index < educations.length) {
      final _educations =
          ObservableList<Education?>.of(this.educations.toList());
      _educations[index] = edu;
      educations = _educations;
    }
  }

  @action
  void setExperienceAtIndex(Experience exp, int index) {
    if (index >= 0 && index < experiences.length) {
      final _experiences =
          ObservableList<Experience?>.of(this.experiences.toList());
      _experiences[index] = exp;
      experiences = _experiences;
    }
  }

  @action
  void validateTechStackId(int value) {
    if (value < 0) {
      formErrorStore.techStack = "Please select your main techstack";
    } else {
      formErrorStore.techStack = null;
    }
  }

  @action
  void validateSkillSets(List<int> value) {
    if (value.length <= 0) {
      formErrorStore.skillset = "Please select at lease 1 skillset";
    } else {
      formErrorStore.skillset = null;
    }
  }

  @action
  void validateLanguages(ObservableList<ProfileLanguage?> value) {
    formErrorStore.languages = ObservableList<ProfileLanguage>.of(
        List<ProfileLanguage>.filled(
            value.length, ProfileLanguage(languageName: "", level: "")));
    for (int i = 0; i < value.length; i++) {
      if (value[i] == null) {
        formErrorStore.languages![i] =
            ProfileLanguage(languageName: "", level: "");
      } else {
        formErrorStore.languages![i] = ProfileLanguage(
            languageName: value[i]!.languageName.isEmpty ? "Required" : "",
            level: value[i]!.level.isEmpty ? "Required" : "");
      }
    }
  }

  @action
  void validateEducations(ObservableList<Education?> value) {
    formErrorStore.educations = ObservableList<Education>.of(
        List<Education>.filled(
            value.length, Education(schoolName: "", startYear: 0, endYear: 0)));

    for (int i = 0; i < value.length; i++) {
      if (value[i] == null) {
        formErrorStore.educations![i] =
            Education(schoolName: "", startYear: 0, endYear: 0);
      } else {
        formErrorStore.educations![i] = Education(
            schoolName: value[i]!.schoolName.isEmpty ? "Required" : "",
            startYear: value[i]!.startYear == 0 ? 1 : 0,
            endYear: value[i]!.endYear == 0 ? 1 : 0);
      }
    }
  }

  @action
  void validateExperiences(ObservableList<Experience?> value) {
    formErrorStore.experiences = ObservableList<Experience>.of(
        List<Experience>.filled(
            value.length,
            Experience(
                title: "",
                description: "",
                startMonth: "",
                endMonth: "",
                skillSets: [])));

    for (int i = 0; i < value.length; i++) {
      if (value[i] == null) {
        formErrorStore.experiences![i] = Experience(
            title: "",
            description: "",
            startMonth: "",
            endMonth: "",
            skillSets: [Skillset(id: -1, name: "name")]);
      } else {
        formErrorStore.experiences![i] = Experience(
            title: value[i]!.title.isEmpty ? "error" : "",
            description: value[i]!.description.isEmpty ? "error" : "",
            startMonth: value[i]!.startMonth.isEmpty ? "error" : "",
            endMonth: value[i]!.endMonth.isEmpty ? "error" : "",
            skillSets: value[i]!.skillSets.length <= 0
                ? []
                : [Skillset(id: -1, name: "name")]);
      }
    }
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateTechStackId(techStackId);
    validateSkillSets(skillSets);
    validateLanguages(languages);
    validateEducations(educations);
    validateExperiences(experiences);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? techStack;

  @observable
  String? skillset;

  @observable
  ObservableList<ProfileLanguage>? languages;

  @observable
  ObservableList<Education>? educations;

  @observable
  ObservableList<Experience>? experiences;

  @computed
  bool get hasErrorsInStep1 =>
      techStack != null ||
      skillset != null ||
      (languages != null &&
          languages!.any(
            (element) =>
                !element.languageName.isEmpty || !element.level.isEmpty,
          )) ||
      (educations != null &&
          educations!.any(
            (element) =>
                !element.schoolName.isEmpty ||
                element.startYear == 1 ||
                element.endYear == 1,
          ));

  @computed
  bool get hasErrorsInStep2 => (experiences == null ||
      experiences!.any((element) =>
          !element.title.isEmpty ||
          !element.description.isEmpty ||
          !element.startMonth.isEmpty ||
          !element.endMonth.isEmpty ||
          element.skillSets.length <= 0));
}
