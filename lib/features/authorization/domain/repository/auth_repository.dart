import 'package:maksimal_test/core/resources/data_state.dart';
import 'package:maksimal_test/features/authorization/data/models/auth.dart';

abstract class AuthRepository {
  // API Methods
  Future<DataState<Auth>> getAuth(var body);

}
