class DateInputConverter {
  String format({required DateTime date}) {
    var dateSplited = date.toString().split(' ');
    return dateSplited.first;
  }
}
