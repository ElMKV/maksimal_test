part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}


class SearchUsers extends SearchEvent {
  final String value;
  SearchUsers(this.value);
}