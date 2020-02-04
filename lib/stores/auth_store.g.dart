// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  Computed<bool> _$isAuthenticatedComputed;

  @override
  bool get isAuthenticated => (_$isAuthenticatedComputed ??=
          Computed<bool>(() => super.isAuthenticated))
      .value;
  Computed<String> _$currentUserTokenComputed;

  @override
  String get currentUserToken => (_$currentUserTokenComputed ??=
          Computed<String>(() => super.currentUserToken))
      .value;

  final _$didVerifyIsLoggedInAtom =
      Atom(name: '_AuthStore.didVerifyIsLoggedIn');

  @override
  bool get didVerifyIsLoggedIn {
    _$didVerifyIsLoggedInAtom.context
        .enforceReadPolicy(_$didVerifyIsLoggedInAtom);
    _$didVerifyIsLoggedInAtom.reportObserved();
    return super.didVerifyIsLoggedIn;
  }

  @override
  set didVerifyIsLoggedIn(bool value) {
    _$didVerifyIsLoggedInAtom.context.conditionallyRunInAction(() {
      super.didVerifyIsLoggedIn = value;
      _$didVerifyIsLoggedInAtom.reportChanged();
    }, _$didVerifyIsLoggedInAtom,
        name: '${_$didVerifyIsLoggedInAtom.name}_set');
  }

  final _$isFetchingAtom = Atom(name: '_AuthStore.isFetching');

  @override
  bool get isFetching {
    _$isFetchingAtom.context.enforceReadPolicy(_$isFetchingAtom);
    _$isFetchingAtom.reportObserved();
    return super.isFetching;
  }

  @override
  set isFetching(bool value) {
    _$isFetchingAtom.context.conditionallyRunInAction(() {
      super.isFetching = value;
      _$isFetchingAtom.reportChanged();
    }, _$isFetchingAtom, name: '${_$isFetchingAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_AuthStore.email');

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

  final _$passwordAtom = Atom(name: '_AuthStore.password');

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

  final _$errorMessageAtom = Atom(name: '_AuthStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$currentUserAtom = Atom(name: '_AuthStore.currentUser');

  @override
  UserModel get currentUser {
    _$currentUserAtom.context.enforceReadPolicy(_$currentUserAtom);
    _$currentUserAtom.reportObserved();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel value) {
    _$currentUserAtom.context.conditionallyRunInAction(() {
      super.currentUser = value;
      _$currentUserAtom.reportChanged();
    }, _$currentUserAtom, name: '${_$currentUserAtom.name}_set');
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  dynamic setDidVerifyIsLoggedIn(bool newValue) {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.setDidVerifyIsLoggedIn(newValue);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsFetching(bool newValue) {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.setIsFetching(newValue);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String newValue) {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.setEmail(newValue);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String newValue) {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.setPassword(newValue);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setErrorMessage(String newValue) {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.setErrorMessage(newValue);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentUser(UserModel newValue) {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.setCurrentUser(newValue);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }
}
