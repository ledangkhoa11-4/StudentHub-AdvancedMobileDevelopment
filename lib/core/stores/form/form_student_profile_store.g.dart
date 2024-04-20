// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_student_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormStudentProfileStore on _FormStudentProfileStore, Store {
  late final _$techStackIdAtom =
      Atom(name: '_FormStudentProfileStore.techStackId', context: context);

  @override
  int get techStackId {
    _$techStackIdAtom.reportRead();
    return super.techStackId;
  }

  @override
  set techStackId(int value) {
    _$techStackIdAtom.reportWrite(value, super.techStackId, () {
      super.techStackId = value;
    });
  }

  late final _$skillSetsAtom =
      Atom(name: '_FormStudentProfileStore.skillSets', context: context);

  @override
  List<int> get skillSets {
    _$skillSetsAtom.reportRead();
    return super.skillSets;
  }

  @override
  set skillSets(List<int> value) {
    _$skillSetsAtom.reportWrite(value, super.skillSets, () {
      super.skillSets = value;
    });
  }

  late final _$languagesAtom =
      Atom(name: '_FormStudentProfileStore.languages', context: context);

  @override
  ObservableList<ProfileLanguage?> get languages {
    _$languagesAtom.reportRead();
    return super.languages;
  }

  @override
  set languages(ObservableList<ProfileLanguage?> value) {
    _$languagesAtom.reportWrite(value, super.languages, () {
      super.languages = value;
    });
  }

  late final _$educationsAtom =
      Atom(name: '_FormStudentProfileStore.educations', context: context);

  @override
  ObservableList<Education?> get educations {
    _$educationsAtom.reportRead();
    return super.educations;
  }

  @override
  set educations(ObservableList<Education?> value) {
    _$educationsAtom.reportWrite(value, super.educations, () {
      super.educations = value;
    });
  }

  late final _$experiencesAtom =
      Atom(name: '_FormStudentProfileStore.experiences', context: context);

  @override
  ObservableList<Experience?> get experiences {
    _$experiencesAtom.reportRead();
    return super.experiences;
  }

  @override
  set experiences(ObservableList<Experience?> value) {
    _$experiencesAtom.reportWrite(value, super.experiences, () {
      super.experiences = value;
    });
  }

  late final _$resumeAtom =
      Atom(name: '_FormStudentProfileStore.resume', context: context);

  @override
  PlatformFile? get resume {
    _$resumeAtom.reportRead();
    return super.resume;
  }

  @override
  set resume(PlatformFile? value) {
    _$resumeAtom.reportWrite(value, super.resume, () {
      super.resume = value;
    });
  }

  late final _$transcriptAtom =
      Atom(name: '_FormStudentProfileStore.transcript', context: context);

  @override
  PlatformFile? get transcript {
    _$transcriptAtom.reportRead();
    return super.transcript;
  }

  @override
  set transcript(PlatformFile? value) {
    _$transcriptAtom.reportWrite(value, super.transcript, () {
      super.transcript = value;
    });
  }

  late final _$_FormStudentProfileStoreActionController =
      ActionController(name: '_FormStudentProfileStore', context: context);

  @override
  void setFile(String label, PlatformFile? file) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.setFile');
    try {
      return super.setFile(label, file);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTechStackId(int value) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.setTechStackId');
    try {
      return super.setTechStackId(value);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSkillsets(List<int> value) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.setSkillsets');
    try {
      return super.setSkillsets(value);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddLanguage(ProfileLanguage lang) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.setAddLanguage');
    try {
      return super.setAddLanguage(lang);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddEducation(Education edu) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.setAddEducation');
    try {
      return super.setAddEducation(edu);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddExperience(Experience exp) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.setAddExperience');
    try {
      return super.setAddExperience(exp);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRemoveLanguage(int index) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.setRemoveLanguage');
    try {
      return super.setRemoveLanguage(index);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRemoveExperience(int index) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.setRemoveExperience');
    try {
      return super.setRemoveExperience(index);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRemoveEducation(int index) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.setRemoveEducation');
    try {
      return super.setRemoveEducation(index);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLanguageAtIndex(ProfileLanguage lang, int index) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.setLanguageAtIndex');
    try {
      return super.setLanguageAtIndex(lang, index);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEducationAtIndex(Education edu, int index) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.setEducationAtIndex');
    try {
      return super.setEducationAtIndex(edu, index);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExperienceAtIndex(Experience exp, int index) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.setExperienceAtIndex');
    try {
      return super.setExperienceAtIndex(exp, index);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTechStackId(int value) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.validateTechStackId');
    try {
      return super.validateTechStackId(value);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateSkillSets(List<int> value) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.validateSkillSets');
    try {
      return super.validateSkillSets(value);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLanguages(ObservableList<ProfileLanguage?> value) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.validateLanguages');
    try {
      return super.validateLanguages(value);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEducations(ObservableList<Education?> value) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.validateEducations');
    try {
      return super.validateEducations(value);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateExperiences(ObservableList<Experience?> value) {
    final _$actionInfo = _$_FormStudentProfileStoreActionController.startAction(
        name: '_FormStudentProfileStore.validateExperiences');
    try {
      return super.validateExperiences(value);
    } finally {
      _$_FormStudentProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
techStackId: ${techStackId},
skillSets: ${skillSets},
languages: ${languages},
educations: ${educations},
experiences: ${experiences},
resume: ${resume},
transcript: ${transcript}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorsInStep1Computed;

  @override
  bool get hasErrorsInStep1 => (_$hasErrorsInStep1Computed ??= Computed<bool>(
          () => super.hasErrorsInStep1,
          name: '_FormErrorStore.hasErrorsInStep1'))
      .value;
  Computed<bool>? _$hasErrorsInStep2Computed;

  @override
  bool get hasErrorsInStep2 => (_$hasErrorsInStep2Computed ??= Computed<bool>(
          () => super.hasErrorsInStep2,
          name: '_FormErrorStore.hasErrorsInStep2'))
      .value;

  late final _$techStackAtom =
      Atom(name: '_FormErrorStore.techStack', context: context);

  @override
  String? get techStack {
    _$techStackAtom.reportRead();
    return super.techStack;
  }

  @override
  set techStack(String? value) {
    _$techStackAtom.reportWrite(value, super.techStack, () {
      super.techStack = value;
    });
  }

  late final _$skillsetAtom =
      Atom(name: '_FormErrorStore.skillset', context: context);

  @override
  String? get skillset {
    _$skillsetAtom.reportRead();
    return super.skillset;
  }

  @override
  set skillset(String? value) {
    _$skillsetAtom.reportWrite(value, super.skillset, () {
      super.skillset = value;
    });
  }

  late final _$languagesAtom =
      Atom(name: '_FormErrorStore.languages', context: context);

  @override
  ObservableList<ProfileLanguage>? get languages {
    _$languagesAtom.reportRead();
    return super.languages;
  }

  @override
  set languages(ObservableList<ProfileLanguage>? value) {
    _$languagesAtom.reportWrite(value, super.languages, () {
      super.languages = value;
    });
  }

  late final _$educationsAtom =
      Atom(name: '_FormErrorStore.educations', context: context);

  @override
  ObservableList<Education>? get educations {
    _$educationsAtom.reportRead();
    return super.educations;
  }

  @override
  set educations(ObservableList<Education>? value) {
    _$educationsAtom.reportWrite(value, super.educations, () {
      super.educations = value;
    });
  }

  late final _$experiencesAtom =
      Atom(name: '_FormErrorStore.experiences', context: context);

  @override
  ObservableList<Experience>? get experiences {
    _$experiencesAtom.reportRead();
    return super.experiences;
  }

  @override
  set experiences(ObservableList<Experience>? value) {
    _$experiencesAtom.reportWrite(value, super.experiences, () {
      super.experiences = value;
    });
  }

  @override
  String toString() {
    return '''
techStack: ${techStack},
skillset: ${skillset},
languages: ${languages},
educations: ${educations},
experiences: ${experiences},
hasErrorsInStep1: ${hasErrorsInStep1},
hasErrorsInStep2: ${hasErrorsInStep2}
    ''';
  }
}
