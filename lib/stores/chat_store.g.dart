// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStoreBase, Store {
  Computed<ChatModel> _$selectedChatComputed;

  @override
  ChatModel get selectedChat =>
      (_$selectedChatComputed ??= Computed<ChatModel>(() => super.selectedChat))
          .value;
  Computed<MessageModel> _$selectedMessageForEditingComputed;

  @override
  MessageModel get selectedMessageForEditing =>
      (_$selectedMessageForEditingComputed ??=
              Computed<MessageModel>(() => super.selectedMessageForEditing))
          .value;

  final _$isAdminViewAtom = Atom(name: '_ChatStoreBase.isAdminView');

  @override
  bool get isAdminView {
    _$isAdminViewAtom.context.enforceReadPolicy(_$isAdminViewAtom);
    _$isAdminViewAtom.reportObserved();
    return super.isAdminView;
  }

  @override
  set isAdminView(bool value) {
    _$isAdminViewAtom.context.conditionallyRunInAction(() {
      super.isAdminView = value;
      _$isAdminViewAtom.reportChanged();
    }, _$isAdminViewAtom, name: '${_$isAdminViewAtom.name}_set');
  }

  final _$isFetchingAtom = Atom(name: '_ChatStoreBase.isFetching');

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

  final _$selectedChatIdAtom = Atom(name: '_ChatStoreBase.selectedChatId');

  @override
  String get selectedChatId {
    _$selectedChatIdAtom.context.enforceReadPolicy(_$selectedChatIdAtom);
    _$selectedChatIdAtom.reportObserved();
    return super.selectedChatId;
  }

  @override
  set selectedChatId(String value) {
    _$selectedChatIdAtom.context.conditionallyRunInAction(() {
      super.selectedChatId = value;
      _$selectedChatIdAtom.reportChanged();
    }, _$selectedChatIdAtom, name: '${_$selectedChatIdAtom.name}_set');
  }

  final _$messageAtom = Atom(name: '_ChatStoreBase.message');

  @override
  String get message {
    _$messageAtom.context.enforceReadPolicy(_$messageAtom);
    _$messageAtom.reportObserved();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.context.conditionallyRunInAction(() {
      super.message = value;
      _$messageAtom.reportChanged();
    }, _$messageAtom, name: '${_$messageAtom.name}_set');
  }

  final _$selectedMessageIdAtom =
      Atom(name: '_ChatStoreBase.selectedMessageId');

  @override
  String get selectedMessageId {
    _$selectedMessageIdAtom.context.enforceReadPolicy(_$selectedMessageIdAtom);
    _$selectedMessageIdAtom.reportObserved();
    return super.selectedMessageId;
  }

  @override
  set selectedMessageId(String value) {
    _$selectedMessageIdAtom.context.conditionallyRunInAction(() {
      super.selectedMessageId = value;
      _$selectedMessageIdAtom.reportChanged();
    }, _$selectedMessageIdAtom, name: '${_$selectedMessageIdAtom.name}_set');
  }

  final _$chatsListAtom = Atom(name: '_ChatStoreBase.chatsList');

  @override
  ObservableList<ChatModel> get chatsList {
    _$chatsListAtom.context.enforceReadPolicy(_$chatsListAtom);
    _$chatsListAtom.reportObserved();
    return super.chatsList;
  }

  @override
  set chatsList(ObservableList<ChatModel> value) {
    _$chatsListAtom.context.conditionallyRunInAction(() {
      super.chatsList = value;
      _$chatsListAtom.reportChanged();
    }, _$chatsListAtom, name: '${_$chatsListAtom.name}_set');
  }

  final _$selectedChatMessagesListAtom =
      Atom(name: '_ChatStoreBase.selectedChatMessagesList');

  @override
  ObservableList<MessageModel> get selectedChatMessagesList {
    _$selectedChatMessagesListAtom.context
        .enforceReadPolicy(_$selectedChatMessagesListAtom);
    _$selectedChatMessagesListAtom.reportObserved();
    return super.selectedChatMessagesList;
  }

  @override
  set selectedChatMessagesList(ObservableList<MessageModel> value) {
    _$selectedChatMessagesListAtom.context.conditionallyRunInAction(() {
      super.selectedChatMessagesList = value;
      _$selectedChatMessagesListAtom.reportChanged();
    }, _$selectedChatMessagesListAtom,
        name: '${_$selectedChatMessagesListAtom.name}_set');
  }

  final _$_ChatStoreBaseActionController =
      ActionController(name: '_ChatStoreBase');

  @override
  dynamic setIsAdminView(bool newValue) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction();
    try {
      return super.setIsAdminView(newValue);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsFetching(bool newValue) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction();
    try {
      return super.setIsFetching(newValue);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedChatId(String newValue) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction();
    try {
      return super.setSelectedChatId(newValue);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeMessage(String newValue) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction();
    try {
      return super.onChangeMessage(newValue);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedMessageId(String newValue) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction();
    try {
      return super.setSelectedMessageId(newValue);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cancelEditingMessage() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction();
    try {
      return super.cancelEditingMessage();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChatsList(List<ChatModel> newValue) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction();
    try {
      return super.setChatsList(newValue);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedChatMessagesList(List<MessageModel> newValue) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction();
    try {
      return super.setSelectedChatMessagesList(newValue);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
