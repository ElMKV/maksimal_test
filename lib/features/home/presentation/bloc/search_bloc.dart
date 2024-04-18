import 'dart:async';

import 'package:bloc/bloc.dart';
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
    final users = await _searchUserUseCase();
    // emit(SearchDone());
  }
}
