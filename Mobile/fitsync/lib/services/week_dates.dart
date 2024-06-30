List<Map<int, String>> getWeekDates() {
  var dateNow = DateTime.now();
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<Map<int, String>> weekDates = [];
  int j = dateNow.weekday - 1;
  for (int i = 0; i < days.length; i++) {
    if (i < dateNow.weekday) {
      var previousDate = dateNow.subtract(Duration(days: j)).day;
      weekDates.add({
        0: (previousDate).toString(),
        1: days[i],
      });
      --j;
    } else if (i == dateNow.weekday) {
      weekDates.add({
        0: (dateNow.day).toString(),
        1: days[i],
      });
    } else {
      var nextDate = dateNow.add(Duration(days: i)).day;
      weekDates.add({
        0: (nextDate).toString(),
        1: days[i],
      });
    }
  }
  return weekDates;
}
