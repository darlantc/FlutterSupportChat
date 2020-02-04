// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStoreBase, Store {
  final _$searchStringAtom = Atom(name: '_SettingsStoreBase.searchString');

  @override
  String get searchString {
    _$searchStringAtom.context.enforceReadPolicy(_$searchStringAtom);
    _$searchStringAtom.reportObserved();
    return super.searchString;
  }

  @override
  set searchString(String value) {
    _$searchStringAtom.context.conditionallyRunInAction(() {
      super.searchString = value;
      _$searchStringAtom.reportChanged();
    }, _$searchStringAtom, name: '${_$searchStringAtom.name}_set');
  }

  final _$isSearchingAtom = Atom(name: '_SettingsStoreBase.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.context.enforceReadPolicy(_$isSearchingAtom);
    _$isSearchingAtom.reportObserved();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.context.conditionallyRunInAction(() {
      super.isSearching = value;
      _$isSearchingAtom.reportChanged();
    }, _$isSearchingAtom, name: '${_$isSearchingAtom.name}_set');
  }

  final _$_currentRouteAtom = Atom(name: '_SettingsStoreBase._currentRoute');

  @override
  APP_ROUTE get _currentRoute {
    _$_currentRouteAtom.context.enforceReadPolicy(_$_currentRouteAtom);
    _$_currentRouteAtom.reportObserved();
    return super._currentRoute;
  }

  @override
  set _currentRoute(APP_ROUTE value) {
    _$_currentRouteAtom.context.conditionallyRunInAction(() {
      super._currentRoute = value;
      _$_currentRouteAtom.reportChanged();
    }, _$_currentRouteAtom, name: '${_$_currentRouteAtom.name}_set');
  }

  final _$_SettingsStoreBaseActionController =
      ActionController(name: '_SettingsStoreBase');

  @override
  dynamic setSearchString(String newValue) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction();
    try {
      return super.setSearchString(newValue);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsSearching(bool newValue) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction();
    try {
      return super.setIsSearching(newValue);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleIsSearching() {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction();
    try {
      return super.toggleIsSearching();
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentRoute(APP_ROUTE route) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction();
    try {
      return super.setCurrentRoute(route);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
