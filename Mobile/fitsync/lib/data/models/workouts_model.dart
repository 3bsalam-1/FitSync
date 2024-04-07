class WorkoutsModel {
  List<String> exercisePlan;
  String category;
  String level;
  String planDurationMn;
  String calBurned;
  List<String> targetMuscle;

  WorkoutsModel({
    required this.exercisePlan,
    required this.category,
    required this.level,
    required this.planDurationMn,
    required this.calBurned,
    required this.targetMuscle,
  });

  factory WorkoutsModel.fromJSON(Map<String, dynamic> json) {
    return WorkoutsModel(
      exercisePlan: convertStringToList(json['Exercise Plan']!),
      category: json['Category']!,
      level: json['Impact Level']!,
      planDurationMn: json['Total Plan Duration (minutes)']!,
      calBurned: json['Calories Burned (Plan)']!,
      targetMuscle: convertStringToList(json['Target Muscle Group']!),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "Exercise Plan": exercisePlan,
      "Category": category,
      "Impact Level": level,
      "Total Plan Duration (minutes)": planDurationMn,
      "Calories Burned (Plan)": calBurned,
      "Target Muscle Group": targetMuscle,
    };
  }
}

List<String> convertStringToList(String text) {
  List<String> result = [];
  RegExp regex = RegExp(r',\s*(?![^(]*\))');

  result = text.split(regex);

  return result;
}
