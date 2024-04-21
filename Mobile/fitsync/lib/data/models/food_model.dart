class FoodModel {
  final String Name;
  final String Catagory;
  final String Description;
  final String Veg_non;
  final String Nutrient;
  final String Diet;

  FoodModel({
    required this.Name,
    required this.Catagory,
    required this.Description,
    required this.Veg_non,
    required this.Nutrient,
    required this.Diet,
  });

  factory FoodModel.fromJson(jsonData) {
    return FoodModel(
        Name: jsonData['Name'],
        Catagory: jsonData['Catagory'],
        Description: jsonData['Description'],
        Veg_non: jsonData['Veg_non'],
        Nutrient: jsonData['Nutrient'],
        Diet: jsonData['Diet']);
  }
}
