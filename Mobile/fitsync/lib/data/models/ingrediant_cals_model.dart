class IngrediantModel {
  final String ingredient;
  final String caloriesPer100Grams;
  

  IngrediantModel({
    required this.ingredient,
    required this.caloriesPer100Grams,
    
  });

  factory IngrediantModel.fromJson(jsonData) {
    return IngrediantModel(
        ingredient: jsonData['Ingredient'],
        caloriesPer100Grams: jsonData['Calories per 100 grams'],
        );
  }
}
