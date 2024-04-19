part of 'search_bloc.dart';

@immutable
abstract class SearchState {
  final PageState pageState;

  const SearchState(this.pageState);
}

class SearchInitial extends SearchState {
  const SearchInitial(PageState pageState) : super(pageState);
}

class SearchLoading extends SearchState {
  const SearchLoading(PageState pageState) : super(pageState);
}

class SearchError extends SearchState {
  const SearchError(PageState pageState) : super(pageState);
}

class SearchDone extends SearchState {
  const SearchDone(PageState pageState) : super(pageState);
}

class PageState {
  final String error;
  final Users users;

  PageState({
    this.users = const Users(),
    this.error = '',
  });

  PageState copyWith({
    Users? users,
    String? error,
  }) {
    return PageState(
      users: users ?? this.users,
      error: error ?? this.error,
    );
  }
}
