import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:maksimal_test/features/home/data/models/users.dart';
import 'package:maksimal_test/features/home/domain/usecases/search_user.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUserUseCase _searchUserUseCase;

  SearchBloc(this._searchUserUseCase) : super(SearchInitial(PageState())) {
    on<SearchUsers>(onSearchUsers);
  }

  void onSearchUsers(SearchUsers event, Emitter<SearchState> emit) async {
    emit(SearchLoading(state.pageState));

    final users = await _searchUserUseCase(params: event.value);

    emit(SearchDone(state.pageState.copyWith(users: users.data)));


  }
}

