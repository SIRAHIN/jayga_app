import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jayga_app/screens/RentalDetails_screen/controller/calander_controller.dart';
import 'package:jayga_app/utils/constants/color.dart';
import 'package:jayga_app/utils/constants/text_style.dart';

class BookingListDates extends StatelessWidget {
  const BookingListDates({
    super.key,
    required this.calenderController,
  });


  final CalenderController calenderController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
  physics: const NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  itemCount: calenderController.dates.length,
  itemBuilder: (context, index) {
    var datesList = calenderController.dates[index];
    return index != 0 && index != calenderController.dates.length -1 ? const SizedBox() : Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child:  Container(
          height: 35,
          color: contentColor,
          width: double.infinity,
          child: Center(
            child: index == 0 
              ? Text(
                  "Check In : ${DateFormat.yMMMEd().format(datesList)}",
                  style: btnText,
                )
              : index == calenderController.dates.length - 1
                ? Text(
                    "Check Out : ${DateFormat.yMMMEd().format(datesList)}",
                    style: btnText,
                  )
                : null ,
          ),
        ),
      ),
    );
  },
);
  }
}
