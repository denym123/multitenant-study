import '../../global_modules.dart';

abstract class UserRepository {
  Future<User> getUser();

  Future<RefreshTokenResponseDto> refreshToken(String? refreshToken);
}
