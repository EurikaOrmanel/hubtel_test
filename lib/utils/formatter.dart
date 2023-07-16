import 'package:intl/intl.dart';

class FormatterUil {
  static final DateFormat _dateFormat = DateFormat("MMMM dd,yyyy");
  static final DateFormat _timeFormat = DateFormat("HH:mm");
  static String formattedDay(DateTime dateTime) => _dateFormat.format(dateTime);

  static String formattedTime(DateTime dateTime) =>
      _timeFormat.format(dateTime);
}
