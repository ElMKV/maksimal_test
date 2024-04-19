import 'package:maksimal_test/core/resources/data_state.dart';
import 'package:maksimal_test/features/authorization/data/models/auth.dart';
import 'package:maksimal_test/features/home/data/models/users.dart';

abstract class SearchRepository {
  // API Methods
  Future<DataState<Users>> searchUser(String body);
}
