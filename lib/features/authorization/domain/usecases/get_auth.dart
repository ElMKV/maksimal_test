import 'package:maksimal_test/core/resources/data_state.dart';
import 'package:maksimal_test/core/usecase/usecase.dart';
import 'package:maksimal_test/features/authorization/data/models/auth.dart';
import 'package:maksimal_test/features/authorization/domain/repository/auth_repository.dart';

class GetAuthUseCase implements UseCase<DataState<Auth>, void> {
  final AuthRepository _authRepository;

  GetAuthUseCase(this._authRepository);

  @override
  Future<DataState<Auth>> call({var params}) {
    return _authRepository.getAuth(params);
  }
}
