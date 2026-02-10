import 'package:signals/signals_core.dart';

import '../../core/core.dart';
import '../global_modules.dart';

class UserStore {
  final UserRepository _userRepository;
  final LocalSecureStorage _localSecureStorage;

  UserStore({
    required UserRepository userRepository,
    required LocalSecureStorage localSecureStorage,
  }) : _userRepository = userRepository,
       _localSecureStorage = localSecureStorage;

  final Signal<User?> _user = Signal(null);

  late final isUserLoggedIn = computed<bool>(() => _user.value != null);

  late final user = computed<User?>(() => _user.value);

  void _setUser(User? user) {
    _user.value = user;
  }

  void editPersonInfo(Person person) {
    final user = _user.value?.copyWith(
      person: Person(
        avatarImage: person.avatarImage,
        birthday: person.birthday,
        name: person.name,
        phone: person.phone,
        email: person.email,
      ),
    );
    _setUser(user);
  }

  void updatePersonImage(String? imagePath) {
    final user = _user.value?.copyWith(
      person: _user.value?.person?.copyWith(avatarImage: imagePath),
    );
    _setUser(user);
  }

  Future<String?> getAccessToken() async {
    return await _localSecureStorage.read(LSConstants.accessToken);
  }

  Future<void> logout() async {
    await Future.wait([
      _localSecureStorage.remove(LSConstants.accessToken),
      _localSecureStorage.remove(LSConstants.refreshToken),
    ]);
    _setUser(null);
  }

  Future<void> refreshToken() async {
    final refreshToken = await _localSecureStorage.read(
      LSConstants.refreshToken,
    );
    final response = await _userRepository.refreshToken(refreshToken);
    await Future.wait([
      _localSecureStorage.write(LSConstants.accessToken, response.accessToken),
      _localSecureStorage.write(
        LSConstants.refreshToken,
        response.refreshToken,
      ),
    ]);
  }

  Future<void> fetchUser() async {
    final value = await _userRepository.getUser();
    _setUser(value);
  }
}
