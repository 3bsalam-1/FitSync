List<Map<int, String>> getWeekDates() {
  var dateNow = DateTime.now();
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<Map<int, String>> weekDates = [];
  int prevouis = dateNow.weekday - 1;
  int after = 1; 
  for (int i = 0; i < days.length; i++) {
    if (i < dateNow.weekday-1) {
      var previousDate = dateNow.subtract(Duration(days: prevouis)).day;
      weekDates.add({
        0: (previousDate).toString(),
        1: days[i],
      });
      --prevouis;
    } else if (i == dateNow.weekday-1) {
      weekDates.add({
        0: (dateNow.day).toString(),
        1: days[i],
      });
    } else {
      var nextDate = dateNow.add(Duration(days: after)).day;
      weekDates.add({
        0: (nextDate).toString(),
        1: days[i],
      });
      ++after;
    }
  }
  return weekDates;
}