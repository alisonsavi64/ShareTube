import 'dart:convert';

import 'package:app/app/domain/entities/dk_keys.dart';
import 'package:app/app/infra/adapter/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LocalStorage localStorage;
  UserBloc({required this.localStorage}) : super(UserState.initial()) {
    on<NewName>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    _initializeState();
  }

  @override
  void onChange(Change<UserState> change) {
    super.onChange(change);
    debugPrint('NEW USER LOCALLY STATE EMITTED: ${change.nextState.toString()}');
  }

  Future<void> _initializeState() async {
    String? jsonUser = await localStorage.read(DBKeys.sessionUserData);
    if (jsonUser != null) {
      Map<String, dynamic> userData = jsonDecode(jsonUser);
      add(NewName(name: userData['name']));
    }
  }
}