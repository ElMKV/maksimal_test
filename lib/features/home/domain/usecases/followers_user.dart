import 'package:maksimal_test/core/resources/data_state.dart';
import 'package:maksimal_test/core/usecase/usecase.dart';
import 'package:maksimal_test/features/home/data/models/users.dart';
import 'package:maksimal_test/features/home/domain/repository/search_repository.dart';

class FollowersUserUseCase implements UseCase<DataState<List<Items>>, void> {
  final SearchRepository _searchRepository;

  FollowersUserUseCase(this._searchRepository);

  @override
  Future<DataState<List<Items>>> call({var params}) {
    return _searchRepository.getFollowersUser(params);
  }
}
