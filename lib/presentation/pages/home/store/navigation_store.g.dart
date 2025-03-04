// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationStore on NavigationStoreStore, Store {
  late final _$selectedIndexAtom =
      Atom(name: 'NavigationStoreStore.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$NavigationStoreStoreActionController =
      ActionController(name: 'NavigationStoreStore', context: context);

  @override
  void setIndex(int index) {
    final _$actionInfo = _$NavigationStoreStoreActionController.startAction(
        name: 'NavigationStoreStore.setIndex');
    try {
      return super.setIndex(index);
    } finally {
      _$NavigationStoreStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
