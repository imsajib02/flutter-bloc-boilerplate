import 'package:intl/intl.dart';

DateFormat _dateFormatter = DateFormat('dd-MM-yyyy');
DateFormat _timeFormatter = DateFormat('hh:mm:ss a');
DateFormat _dateTimeFormatter = DateFormat('dd-MM-yyyy hh:mm:ss a');
DateFormat _serverDateFormatter = DateFormat('yyyy-MM-dd');
DateFormat _fullMonthNameFormatter = DateFormat('d MMM, y');

extension DateTimeExtension on DateTime {

  String get toDateString => _dateFormatter.format(this);
  String get toTimeString => _timeFormatter.format(this);
  String get toDateTimeString => _dateTimeFormatter.format(this);
  String get toServerDateTimeString => _serverDateFormatter.format(this);
  String get toDateWithFullMonthString => _fullMonthNameFormatter.format(this);
}