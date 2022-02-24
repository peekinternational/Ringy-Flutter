

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class HelperClass
{
  static  String getFormatedDate(_date) {
    var inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('M/d EEE');
    return outputFormat.format(inputDate);
  }

}