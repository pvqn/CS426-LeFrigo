import 'package:flutter_test/flutter_test.dart';
import 'package:lefrigo/services/get_it.dart';

void main() {
  setUpAll(() async => await configureDependencies());

  test('user with token success', () async {
    final userService = getIt<UserService>();

    final user = await userService.getCurrentUser();

    expect(user, isNotEmpty);
  });
}
