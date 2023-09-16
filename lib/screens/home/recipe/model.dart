class dummy {
  String prepTime = '10 min';
  String cookTime = '10 min';
  String refTime = '10 min';
  String totalTime = '10 min';
  String nameRecipe = 'Greek Yogurt Chia pudding';
  String image = 'assets/images/welcome_bg.png';
  int likes = 2000;
  String nameUser = 'antihcmus';
  String description =
      'I have a strong aversion to HCMUS. I hold a deep-seated dislike for HCMUS. I harbor a strong aversion towards HCMUS and find it to be quite displeasing';
  int serving = 2;
  double cal = 10;
  double fat = 7;
  double carb = 33;
  double protein = 33;
  List<ingredient> ingredients = [ingredient(), ingredient()];
  List<String> directions = ['antihcmus', 'antihcmus'];
}

class ingredient {
  String name = 'greek yogurt';
  String note = 'anti hcmus';
  String quantity = '5.3 ounce';
}
