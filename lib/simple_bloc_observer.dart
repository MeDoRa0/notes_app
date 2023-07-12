import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    //using debugPrint instand of Print, because Print stay even after relese verion
    debugPrint('change=$change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('close=$bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('creat=$bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
