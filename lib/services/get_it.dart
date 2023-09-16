import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:lefrigo/services/auth_service.dart';
import 'package:lefrigo/services/api_service.dart';
import 'package:lefrigo/services/recipe_service.dart';
import 'package:lefrigo/services/user_service.dart';
import 'package:lefrigo/services/credential_service.dart';

// export list of services
export 'api_service.dart';
export 'credential_service.dart';
export 'user_service.dart';
export 'auth_service.dart';
export 'recipe_service.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerSingleton<ApiService>(ApiService());

  getIt.registerSingleton<CredentialService>(
    CredentialService(
      storage: const FlutterSecureStorage(
        iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      ),
    ),
  );

  getIt.registerSingleton<UserService>(
    UserService(apiService: getIt<ApiService>()),
  );

  getIt.registerSingleton<AuthService>(
    AuthService(
      apiService: getIt<ApiService>(),
    ),
  );

  getIt.registerSingleton<RecipeService>(
    RecipeService(apiService: getIt<ApiService>()),
  );

  await getIt.allReady();
}
