abstract class UseCase<Type, Params> {
  Future<Type> call({var params});
}
