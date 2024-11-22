import 'package:intl/intl.dart';

String convert_utc_time(String utctime){
  String isoDateString = utctime;

  DateTime utcDateTime = DateTime.parse(isoDateString);

  DateTime istDateTime = utcDateTime.add(Duration(hours: 5, minutes: 30));

  String formattedDate = DateFormat('dd-MM-yyyy HH:mm a').format(istDateTime);

  return formattedDate;

}

String formatDate(String dateTimeString) {
  try {
    // Parse the DateTime string
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Format the DateTime to the desired format
    return DateFormat('dd-MMMM-yyyy').format(dateTime);
  } catch (e) {
    // Handle parsing error
    return 'Invalid date';
  }
}

String formatTime(String dateTimeString) {
  try {
    // Parse the DateTime string
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Format the DateTime to the desired time format
    return DateFormat('hh:mm a').format(dateTime);
  } catch (e) {
    // Handle parsing error
    return 'Invalid time';
  }
}

String formatDayAndTime(String dateTimeString) {
  try {
    // Parse the DateTime string
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Get the day of the week (e.g., "Saturday")
    String dayOfWeek = DateFormat('EEEE').format(dateTime);

    // Get the time in 12-hour format (e.g., "3 AM")
    String time = DateFormat('h a').format(dateTime);

    return '$dayOfWeek at $time';
  } catch (e) {
    // Handle parsing error
    return 'Invalid date/time';
  }
}