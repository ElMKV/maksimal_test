import 'package:maksimal_test/core/resources/data_state.dart';
import 'package:maksimal_test/core/usecase/usecase.dart';
import 'package:maksimal_test/features/home/data/models/users.dart';
import 'package:maksimal_test/features/home/domain/repository/search_repository.dart';

class SearchUserUseCase implements UseCase<DataState<Users>, void> {
  final SearchRepository _searchRepository;

  SearchUserUseCase(this._searchRepository);

  @override
  Future<DataState<Users>> call({var params}) {
    return _searchRepository.searchUser(params);
  }
}
