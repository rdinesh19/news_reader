

import 'package:easy_localization/easy_localization.dart';

const String rupeeSymbol = '₹';
const Pattern pattern = r'^[a-zA-Z]+$';
const Pattern emailPattern =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}";

const String numberpattern = r'^[0-9]+$';

const Pattern passwordpattern =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

convertDate (String timeStamp){
  if(timeStamp.isNotEmpty) {
    DateTime dateTime = DateTime.parse(timeStamp);
    String formattedDateTime = DateFormat("MMMM dd, yyyy").format(dateTime);
    return formattedDateTime;
  }else {
    return '';
  }
}
convertDate2 (String timeStamp){
  if(timeStamp.isNotEmpty) {
  DateTime dateTime = DateTime.parse(timeStamp);
  //DateFormat('MM/dd/yyyy').format(date)
  String formattedDateTime = DateFormat("dd/MM/yyyy").format(dateTime);
  return formattedDateTime;
  }else {
    return '';
  }
}
String formatTimeDifference(String time,) {
  DateTime to =DateTime.now();
  DateTime from =DateTime.parse(time);
  Duration difference = to.difference(from);
  if (difference.inSeconds < 60) {
    return '${difference.inSeconds} sec ago';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} min ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hr ago';
  } else if (difference.inDays < 30) {
    return '${difference.inDays} d ago';
  } else {
    int years = to.year - from.year;
    int months = to.month - from.month;

    if (months < 0) {
      years -= 1;
      months += 12;
    }

    if (years > 0) {
      if (months > 0) {
        return '$years ${years > 1 ? 'y' : 'y'} and $months ${months > 1 ? 'm' : 'm'} ago';
      } else {
        return '$years ${years > 1 ? 'y' : 'y'} ago';
      }
    } else {
      return '$months ${months > 1 ? 'm' : 'm'} ago';
    }
  }
}
