// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_form_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserFormModel on _UserFormModelBase, Store {
  Computed<String> _$validateNameComputed;

  @override
  String get validateName =>
      (_$validateNameComputed ??= Computed<String>(() => super.validateName))
          .value;

  final _$nameAtom = Atom(name: '_UserFormModelBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_UserFormModelBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_UserFormModelBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$confirmPasswordAtom =
      Atom(name: '_UserFormModelBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.context.enforceReadPolicy(_$confirmPasswordAtom);
    _$confirmPasswordAtom.reportObserved();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.context.conditionallyRunInAction(() {
      super.confirmPassword = value;
      _$confirmPasswordAtom.reportChanged();
    }, _$confirmPasswordAtom, name: '${_$confirmPasswordAtom.name}_set');
  }

  final _$isWaitingAtom = Atom(name: '_UserFormModelBase.isWaiting');

  @override
  bool get isWaiting {
    _$isWaitingAtom.context.enforceReadPolicy(_$isWaitingAtom);
    _$isWaitingAtom.reportObserved();
    return super.isWaiting;
  }

  @override
  set isWaiting(bool value) {
    _$isWaitingAtom.context.conditionallyRunInAction(() {
      super.isWaiting = value;
      _$isWaitingAtom.reportChanged();
    }, _$isWaitingAtom, name: '${_$isWaitingAtom.name}_set');
  }

  final _$_UserFormModelBaseActionController =
      ActionController(name: '_UserFormModelBase');

  @override
  dynamic setIsWaiting(bool newValue) {
    final _$actionInfo = _$_UserFormModelBaseActionController.startAction();
    try {
      return super.setIsWaiting(newValue);
    } finally {
      _$_UserFormModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String newValue) {
    final _$actionInfo = _$_UserFormModelBaseActionController.startAction();
    try {
      return super.setName(newValue);
    } finally {
      _$_UserFormModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String newValue) {
    final _$actionInfo = _$_UserFormModelBaseActionController.startAction();
    try {
      return super.setEmail(newValue);
    } finally {
      _$_UserFormModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String newValue) {
    final _$actionInfo = _$_UserFormModelBaseActionController.startAction();
    try {
      return super.setPassword(newValue);
    } finally {
      _$_UserFormModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setConfirmPassword(String newValue) {
    final _$actionInfo = _$_UserFormModelBaseActionController.startAction();
    try {
      return super.setConfirmPassword(newValue);
    } finally {
      _$_UserFormModelBaseActionController.endAction(_$actionInfo);
    }
  }
}
