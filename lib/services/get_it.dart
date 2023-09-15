import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:lefrigo/services/auth_service.dart';
import 'package:lefrigo/services/dio_service.dart';
import 'package:lefrigo/services/recipe_service.dart';
import 'package:lefrigo/services/user_service.dart';
import 'package:lefrigo/services/credential_service.dart';

// export list of services
export 'dio_service.dart';
export 'credential_service.dart';
export 'user_service.dart';
export 'auth_service.dart';
export 'recipe_service.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerSingleton<CredentialService>(
    CredentialService(
      storage: const FlutterSecureStorage(
        iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      ),
    ),
  );

  getIt.registerSingleton<DioService>(
    DioService(),
  );

  getIt.registerSingletonWithDependencies<UserService>(
    () => UserService(dioService: getIt<DioService>()),
    dependsOn: [DioService],
  );

  getIt.registerSingletonWithDependencies<AuthService>(
    () => AuthService(dioService: getIt<DioService>()),
    dependsOn: [DioService],
  );

  getIt.registerSingletonWithDependencies<RecipeServices>(
    () => RecipeServices(dioService: getIt<DioService>()),
    dependsOn: [DioService],
  );
}
