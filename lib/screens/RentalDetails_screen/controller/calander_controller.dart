import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';


class CalenderController extends GetxController{

  DateRangeFormField? dateRangeFormField;

   RxList<DateTime> dates = RxList();
   Rx<DateTime> startDate = DateTime.now().obs;
   Rx<DateTime> endDate = DateTime.now().obs;

  Future<List<DateTime>> showDate(BuildContext context, DateTime fDate, DateTime lDate) async {
  DateTimeRange? dateRange = await showDateRangePicker(
    
    context: context,
    firstDate: fDate,
    lastDate: lDate,
    initialEntryMode: DatePickerEntryMode.calendarOnly,
    initialDateRange: DateTimeRange(start: startDate.value , end: endDate.value ),
  );

  if (dateRange != null) {
    
     startDate.value = dateRange.start;
     endDate.value = dateRange.end;
     update();
     dates.clear();
    // Iterate through the date range and add each date to the list
    for (DateTime date = startDate.value; date.isBefore(endDate.value) || date.isAtSameMomentAs(endDate.value); date = date.add(const Duration(days: 1))) {
      dates.add(date);
    }
    update();
    return dates;
  } else {
    return []; // Return an empty list if no date range is selected
  }

 
}




  
  
  
}

