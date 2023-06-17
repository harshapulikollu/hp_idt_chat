import 'package:intl/intl.dart';

///common methods for reuse
class Utils {
  static String getFormattedDate(int timestamp) {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(timestamp);
    if(_isToday(dt)){
      return DateFormat('hh:mm').format(dt);
    }else{
      return '${DateFormat('MM-dd').format(dt)}  ${DateFormat('hh:mm').format(dt)}';
    }
  }

  static bool _isToday(DateTime dateTime) {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final formattedDateTime = formatter.format(dateTime);
    final formattedNow = formatter.format(now);
    return formattedDateTime == formattedNow;
  }
}