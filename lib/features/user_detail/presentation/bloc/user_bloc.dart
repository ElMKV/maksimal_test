import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:maksimal_test/features/home/data/models/users.dart';
import 'package:maksimal_test/features/user_detail/data/models/repo.dart';
import 'package:maksimal_test/features/user_detail/domain/usecases/user_detail.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase _userUseCase;

  UserBloc(this._userUseCase) : super(UserInitial(PageState())) {
    on<GetDetailUser>(onGetUserDetail);
  }

  void onGetUserDetail(GetDetailUser event, Emitter<UserState> emit) async {
    emit(UserLoading(state.pageState));

    final repos = await _userUseCase(params: event.login);

    emit(UserDone(state.pageState.copyWith(repos: repos.data)));

  }
}
