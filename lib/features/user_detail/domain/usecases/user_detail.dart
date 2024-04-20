import 'package:maksimal_test/core/resources/data_state.dart';
import 'package:maksimal_test/core/usecase/usecase.dart';
import 'package:maksimal_test/features/user_detail/data/models/repo.dart';
import 'package:maksimal_test/features/user_detail/domain/repository/user_detail_repository.dart';

class UserUseCase implements UseCase<DataState<List<Repo>>, void> {
  final UserRepository _userRepository;

  UserUseCase(this._userRepository);

  @override
  Future<DataState<List<Repo>>> call({var params}) {
    return _userRepository.getUserDetail(params);
  }
}
