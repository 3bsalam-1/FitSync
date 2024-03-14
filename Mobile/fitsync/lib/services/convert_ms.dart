String convertToMS(String data) {
  int seconds = (double.parse(data) * 60).toInt();
  int sec = seconds % 60;
  int min = (seconds / 60).floor();
  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
  return "$minute : $second";
}

String convertSecondsToMS(int seconds) {
  int sec = seconds % 60;
  int min = (seconds / 60).floor();
  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
  return "$minute : $second";
}
