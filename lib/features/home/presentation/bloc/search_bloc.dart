import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:maksimal_test/core/constants/strings.dart';
import 'package:maksimal_test/features/home/data/models/users.dart';
import 'package:maksimal_test/features/home/domain/usecases/search_user.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/followers_user.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUserUseCase _searchUserUseCase;
  final FollowersUserUseCase _followersUserUseCase;

  SearchBloc(this._searchUserUseCase, this._followersUserUseCase)
      : super(SearchInitial(PageState())) {
    on<SearchUsers>(onSearchUsers);
    on<GetFollowersUser>(onGetFollowersUser);
  }

  void onSearchUsers(SearchUsers event, Emitter<SearchState> emit) async {
    emit(SearchLoading(state.pageState));

    final users = await _searchUserUseCase(params: event.value);

    if (users.data!.items.isNotEmpty) {
      emit(SearchDone(state.pageState.copyWith(users: users.data)));
    } else {
      emit(SearchError(state.pageState.copyWith(error: S.profile_error)));
    }
  }

  void onGetFollowersUser(
      GetFollowersUser event, Emitter<SearchState> emit) async {
    final userCount = await _followersUserUseCase(params: event.login);
    print(userCount.error?.error.toString());
    print(userCount.error?.response.toString());
    if(userCount.data == null){
      print('not ok');
      emit(SearchError(state.pageState.copyWith(fError:'${S.error_title} ${userCount.error?.response?.statusCode}')));

    }
    else{
      print('ok');
      emit(SearchDone(state.pageState.copyWith(fCount: userCount.data?.length.toString())));
    }

  }
}
