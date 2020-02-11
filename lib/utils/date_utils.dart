import 'package:intl/intl.dart';

String formattedDayAndHourFromFirebaseTimestamp(int firebaseTimestamp) {
  var date = DateTime.fromMicrosecondsSinceEpoch(firebaseTimestamp * 1000);
  var formatter = DateFormat("dd/MM/yy HH:mm");
  return formatter.format(date);
}
