class VitalInfoModel {
  final num inTake;
  final num activeHours;
  final List<ListVitalInfo> steps;
  final List<ListVitalInfo> avaheartbeat;
  final List<ListVitalInfo> sleepHours;
  final List<ListVitalInfo> burned;

  VitalInfoModel({
    required this.inTake,
    required this.activeHours,
    required this.steps,
    required this.avaheartbeat,
    required this.sleepHours,
    required this.burned,
  });

  factory VitalInfoModel.fromJson(Map<String, dynamic> json) {
    return VitalInfoModel(
      inTake: json['inTake'],
      activeHours: json['activeHours'],
      steps: ListVitalInfo.getVitalInfoList(json['steps'], dataName: 'steps'),
      avaheartbeat: ListVitalInfo.getVitalInfoList(json['avaheartbeat'],
          dataName: 'avaheartbeat'),
      sleepHours: ListVitalInfo.getVitalInfoList(json['sleepHours'],
          dataName: 'sleepHours'),
      burned:
          ListVitalInfo.getVitalInfoList(json['burned'], dataName: 'burned'),
    );
  }
}

class ListVitalInfo {
  final DateTime date;
  final dynamic value;

  ListVitalInfo({
    required this.date,
    required this.value,
  });

  factory ListVitalInfo.fromJson(
    Map<String, dynamic> json, {
    required String dataName,
  }) {
    return ListVitalInfo(
      date: DateTime.parse(json['timestamps']),
      value: json[dataName],
    );
  }

  static List<ListVitalInfo> getVitalInfoList(
    List<dynamic> body, {
    required String dataName,
  }) {
    List<ListVitalInfo> data = body
        .map(
          (json) => ListVitalInfo.fromJson(
            json,
            dataName: dataName,
          ),
        )
        .toList();
    return data;
  }
}
