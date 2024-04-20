import 'package:maksimal_test/core/resources/data_state.dart';
import 'package:maksimal_test/features/user_detail/data/models/repo.dart';

abstract class UserRepository {
  // API Methods
  Future<DataState<List<Repo>>> getUserDetail(String login);
}
