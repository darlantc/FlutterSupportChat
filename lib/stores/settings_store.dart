import 'package:flutter_chat/routes/app_routes.dart';
import 'package:mobx/mobx.dart';
part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  @observable
  String searchString = "";
  @observable
  bool isSearching = false;

  @observable
  APP_ROUTE _currentRoute = APP_ROUTE.HOME;

  @action
  setSearchString(String newValue) => this.searchString = newValue;
  @action
  setIsSearching(bool newValue) => this.isSearching = newValue;
  @action
  toggleIsSearching() => this.isSearching = !this.isSearching;

  @action
  setCurrentRoute(APP_ROUTE route) => this._currentRoute = route;

  navigateToRoute(APP_ROUTE route) {
    this.setCurrentRoute(route);
  }
}
