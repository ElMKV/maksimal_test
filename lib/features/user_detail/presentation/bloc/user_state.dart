part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final PageState pageState;

  const UserState(this.pageState);
}

class UserInitial extends UserState {
  const UserInitial(PageState pageState) : super(pageState);

}

class UserLoading extends UserState {
  const UserLoading(PageState pageState) : super(pageState);
}

class UserError extends UserState {
  const UserError(PageState pageState) : super(pageState);
}

class UserDone extends UserState {
  const UserDone(PageState pageState) : super(pageState);
}


class PageState {
  final String error;
  final List<Repo> repos;
  final Users users;
  final String fCount;

  PageState({
    this.users = const Users(),
    this.error = '',
    this.repos = const[],
    this.fCount = '',
  });

  PageState copyWith({
    Users? users,
    List<Repo>? repos,
    String? error,
    String? fCount,
  }) {
    return PageState(
      users: users ?? this.users,
      repos: repos ?? this.repos,
      error: error ?? this.error,
      fCount: fCount ?? this.fCount,
    );
  }
}