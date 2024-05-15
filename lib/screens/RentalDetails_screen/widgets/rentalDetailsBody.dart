import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:jayga_app/screens/RentalDetails_screen/controller/calander_controller.dart';
import 'package:jayga_app/screens/RentalDetails_screen/widgets/bookingListDates.dart';
import 'package:jayga_app/screens/RentalDetails_screen/widgets/details_Body_text.dart';
import 'package:jayga_app/models/rentalModel.dart';
import 'package:jayga_app/utils/constants/text_style.dart';

class RentalDetailsBody extends StatelessWidget {
  const RentalDetailsBody({
    super.key,
    required this.rentalData,
    required this.availableFrom,
    required this.availableFromTime,
    required this.availableUntil,
    required this.availableUntilTime,
    required this.calenderController,
    required this.screenHeight,
  });

  final RentalsModel rentalData;
  final String availableFrom;
  final String availableFromTime;
  final String availableUntil;
  final String availableUntilTime;
  final CalenderController calenderController;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const DetailsBodyText(
          tText: "Rents Amount",
          textStyle: dTileTitleText,
        ),
        DetailsBodyText(
          tText:
              "Rents per Night ${rentalData.rentalPerNight} ${rentalData.shortStay == true ? "\n" "Slot Rent - ${rentalData.slotRent}" : ""}",
          textStyle: bodyText,
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Location",
          style: dTileTitleText,
        ),
        DetailsBodyText(
          tText: "${rentalData.address} | ${rentalData.city}",
          textStyle: bodyText,
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Owner Information",
          style: dTileTitleText,
        ),
        DetailsBodyText(
          tText:
              "Name: ${rentalData.landlordName} \nContact Number: ${rentalData.landlordPhone}",
          textStyle: bodyText,
        ),
        const SizedBox(
          height: 15,
        ),
        const DetailsBodyText(
          tText: "Available",
          textStyle: dTileTitleText,
        ),
        Text(
          "Available from - $availableFrom, $availableFromTime\nAvailable until - $availableUntil, $availableUntilTime",
          style: bodyText,
        ),
        const SizedBox(
          height: 15,
        ),
        const Center(
          child: DetailsBodyText(
            tText: "Booked Date",
            textStyle: dTileTitleText,
          ),
        ),
        Obx(
          () => Center(
            child: Text(
              "Total Booking : ${calenderController.dates.length} Days",
              style: tileBodyText,
            ),
          ),
        ),
        Obx(
          () => calenderController.dates.isEmpty
              ? const Center(child: Text("No Booking Yet"))
              // ---- Booking Dates List section ---- //
              : BookingListDates(calenderController: calenderController),
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          // --- Calling calenderFunction by Controller --- //
          onTap: () async {
            await calenderController.showDate(
              context,
              DateTime(2024),
              DateTime.now().add(const Duration(days: 365)),
            );
          },
          child: Container(
            alignment: Alignment.center,
            height: screenHeight * .06,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.teal),
            child: const Text(
              "Check Availability",
              style: btnText,
            ),
          ),
        ),
      ],
    );
  }
}
