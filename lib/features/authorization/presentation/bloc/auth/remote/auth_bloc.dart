import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maksimal_test/core/constants/strings.dart';
import 'package:maksimal_test/core/resources/data_state.dart';
import 'package:maksimal_test/features/authorization/data/models/auth.dart';
import 'package:maksimal_test/features/authorization/domain/usecases/get_auth.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetAuthUseCase _getAuthUseCase;

  AuthBloc(this._getAuthUseCase) : super(AuthInitial(PageState())) {
    on<GetAuth>(onGetAuth);
  }

  Future<void> onGetAuth(GetAuth event, Emitter<AuthState> emit) async {
    final dataState = await _getAuthUseCase(params: {
      "email": event.login,
      "password": event.pass,
      "extendAuthPeriod": 1
    }); // _getArticleUseCase.call() is equal to _getArticleUseCase() in Dart (Object.call() == Object())
    if (dataState is DataSuccess && dataState.data != null) {
      emit(AuthNav(state.pageState
          .copyWith(onAwait: false, errMsg: S.auth_error, isLogined: true)));
    }

    if (dataState is DataFailed) {
      debugPrint(dataState.error.toString());
      emit(AuthError(state.pageState.copyWith(
        onAwait: false,
        errMsg: S.auth_error,
      )));
    }
  }
}
