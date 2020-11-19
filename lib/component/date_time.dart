import 'package:timeago/timeago.dart' as timeago;

// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
//
// import '../app_state.dart';
//
// class AppliedDateTimeText extends StatelessWidget {
//   int index;
//   AppliedDateTimeText({this.index});
//
//   // ------------------------------- METHODS ------------------------------
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppState>(
//       builder: (_, state, __) {
//         final date = state.getResponseJson()[index]['created_at'];
//         final relativeTime = date.relativeTimeString;
//         final dateString = date.dateFormattedString;
//         return Text(
//           '$appliedString $relativeTime $dateString',
//           style: textStyles.mediumTextStyle
//               .copyWith(fontSize: 12, color: Colors.black),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

String convertUnixTimeStamp(int unixtime) {
  var date = DateTime.fromMillisecondsSinceEpoch(unixtime * 1000);
  timeago.setLocaleMessages('en', CustomEn());
  return timeago.format(date);
}

class CustomEn extends timeago.EnShortMessages {
  @override
  String prefixAgo() => '';
  String prefixFromNow() => '';
  String suffixAgo() => 'ago';
  String suffixFromNow() => '';

  String lessThanOneMinute(int seconds) => '1m';
  String aboutAMinute(int minutes) => '1m';
  String minutes(int minutes) => '$minutes' + 'm';

  String aboutAnHour(int minutes) => '1h';
  String hours(int hours) => '$hours' + 'h';

  String aDay(int hours) => '1d';
  String days(int days) => '$days' + 'd';

  String aboutAMonth(int days) => '1 month';
  String months(int months) => '$months ' + 'months';

  String aboutAYear(int year) => '1y';
  String years(int years) => '$years' + 'y';
}
