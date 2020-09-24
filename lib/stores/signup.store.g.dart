// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStore, Store {
  final _$iconSelectedAtom = Atom(name: '_SignUpStore.iconSelected');

  @override
  String get iconSelected {
    _$iconSelectedAtom.reportRead();
    return super.iconSelected;
  }

  @override
  set iconSelected(String value) {
    _$iconSelectedAtom.reportWrite(value, super.iconSelected, () {
      super.iconSelected = value;
    });
  }

  final _$_SignUpStoreActionController = ActionController(name: '_SignUpStore');

  @override
  void setIcon(String pIconSelected) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setIcon');
    try {
      return super.setIcon(pIconSelected);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
iconSelected: ${iconSelected}
    ''';
  }
}
