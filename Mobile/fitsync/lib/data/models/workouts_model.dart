// ignore_for_file: public_member_api_docs, sort_constructors_first
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
}

List<String> convertStringToList(String text) {
  RegExp regExp = RegExp(r'(\w+)(?:,|\s+)?(?=\()');
  Iterable<RegExpMatch> matches = regExp.allMatches(text);
  List<String> result = [];

  for (RegExpMatch match in matches) {
    String? group = match.group(1);
    if (group != null) {
      result.add(group);
    }
  }

  return result;
}
