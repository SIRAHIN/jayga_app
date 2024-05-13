import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class CalenderController extends GetxController{

  final Rx<String> startingDate ="".obs; 
   final Rx<String> endDate ="".obs;

   RxInt dateDifference = 0.obs;

  // get calender data range //
  Future<DateTimeRange?> showDate (BuildContext context, DateTime fDate, DateTime lDate ) {
    return showDateRangePicker(
    context: context, firstDate: fDate, lastDate: lDate,
    );    
  }

  // total booking days count function //
  List<String> getDatesBetween(DateTime startDate, DateTime endDate) {
  List<String> dates = [];
  DateTime currentDate = startDate;
  while (currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
    dates.add(DateFormat('yyyy-MM-dd').format(currentDate));
    currentDate = currentDate.add(const Duration(days: 1));
  }
  return dates;
}

  
  
  
}

