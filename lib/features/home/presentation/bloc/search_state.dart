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
  bool onAwait;
  String dateTime;
  String error;
  List<bool> isRead;
  bool isOffline;
  int selectedCat;
  List<String> category;

  PageState({
    this.onAwait = false,
    this.dateTime = '',
    this.error = '',
    this.isOffline = false,
    this.isRead = const [],
    this.selectedCat = 0,
    this.category = const ["arts", "automobiles", "books/review", "business", "fashion", "food", "health", "home", "insider", "magazine", "movies", "nyregion", "obituaries", "opinion", "politics", "realestate", "science", "sports", "sundayreview", "technology", "theater", "t-magazine", "travel", "upshot", "us", "world"],
  });

  PageState copyWith({
    bool? onAwait,
    bool? isOffline,
    String? dateTime,
    String? error,
    List<bool>? isRead,
    int? selectedCat,
    List<String>? category,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      isOffline: isOffline ?? this.isOffline,
      isRead: isRead ?? this.isRead,
      dateTime: dateTime ?? this.dateTime,
      error: error ?? this.error,
      selectedCat: selectedCat ?? this.selectedCat,
      category: category ?? this.category,
    );
  }
}
