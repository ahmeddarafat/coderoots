import 'package:coderoots/core/network/api_result.dart';

abstract class BaseUseCase<In, Out> {
  Future<ApiResult<Out>> execute(In input);
}
