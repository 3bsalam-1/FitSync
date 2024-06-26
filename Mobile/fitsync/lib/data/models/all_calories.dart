class AllCaloriesModel {
  final double totalDailyCalories;
  
  

  AllCaloriesModel({
    required this.totalDailyCalories,
    
  });

  factory AllCaloriesModel.fromJson(jsonData) {
    return AllCaloriesModel(
        totalDailyCalories: jsonData['Total Daily Calories'],
        );
  }
}
