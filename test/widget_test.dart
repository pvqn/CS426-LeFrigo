import 'package:flutter_test/flutter_test.dart';
import 'package:lefrigo/services/get_it.dart';

void main() {
  setUpAll(() async {
    await configureDependencies();
  });

  test('fetch recipe from api', () async {
    final recipeService = getIt<RecipeService>();
    expect(() async {
      await recipeService.getRecipeById(id: '64f6c0f7a2655358a8196f4d');
    }, returnsNormally);
  });
}
