import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:lefrigo/services/api_services.dart';
import 'package:lefrigo/services/secure_storage_service.dart';
import 'package:lefrigo/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

// export list of services
export 'api_services.dart';
export 'secure_storage_service.dart';
export 'storage_service.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerSingletonAsync<StorageService>(
    () async => StorageService(storage: await SharedPreferences.getInstance()),
  );

  getIt.registerSingleton<SecureStorageService>(
    SecureStorageService(storage: const FlutterSecureStorage()),
  );

  getIt.registerSingleton<ApiService>(
    ApiService(),
  );
}
