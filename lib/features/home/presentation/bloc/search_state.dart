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
class FollowersError extends SearchState {
  const FollowersError(PageState pageState) : super(pageState);
}

class SearchDone extends SearchState {
  const SearchDone(PageState pageState) : super(pageState);
}

class PageState {
  final String error;
  final String fError;
  final Users users;
  final String fCount;

  PageState({
    this.users = const Users(),
    this.error = '',
    this.fError = '',
    this.fCount = '',
  });

  PageState copyWith({
    Users? users,
    String? fError,
    String? error,
    String? fCount,
  }) {
    return PageState(
      users: users ?? this.users,
      fError: fError ?? this.fError,
      error: error ?? this.error,
      fCount: fCount ?? this.fCount,
    );
  }
}
