import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jayga_app/screens/RentalDetails_screen/controller/calander_controller.dart';
import 'package:jayga_app/screens/RentalDetails_screen/widgets/details_tile_text.dart';
import 'package:jayga_app/screens/home%20screen/models/rentalsListModel.dart';
import 'package:jayga_app/utils/constants/color.dart';
import 'package:jayga_app/utils/constants/text_style.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    DateTimeRange? result;

    final calenderController = Get.put(CalenderController());

    RentalsListModel rentalData = Get.arguments['indexData'];
    String availableFrom =
        DateFormat.yMMMEd().format(rentalData.availableFrom!);
    String availableFromTime =
        DateFormat.jm().format(rentalData.availableFrom!);
    String availableUntil =
        DateFormat.yMMMEd().format(rentalData.availableUntil!);
    String availableUntilTime =
        DateFormat.jm().format(rentalData.availableUntil!);
        

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage("${rentalData.rentSpaceImg}"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      left: 20,
                      child: CircleAvatar(
                        backgroundColor: contentColor,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    // color: Colors.green,
                    ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 6),
                  ),
                ]),
            alignment: Alignment.center,
            height: screenHeight * .6,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
          
                    const DetailsTileText(
                      tText: "Rents Amount",
                      textStyle: dTileTitleText,
                    ),

                    DetailsTileText(
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
                    DetailsTileText(
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
                    DetailsTileText(
                      tText:
                          "Name: ${rentalData.landlordName} \nContact Number: ${rentalData.landlordPhone}",
                      textStyle: bodyText,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    const DetailsTileText(
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

                    const DetailsTileText(
                      tText: "Booked Date",
                      textStyle: dTileTitleText,
                    ),
                    Obx(
                      () => Text(
                        "Booked from - ${calenderController.startingDate}\nBooked until - ${calenderController.endDate}",
                        style: bodyText,
                      ),
                    ),

                    Obx(() =>  Text("total dates : ${calenderController.dateDifference}", style: bodyText,)),

                    const SizedBox(
                      height: 15,
                    ),

                    InkWell(
                      onTap: () async {
                        result = await calenderController.showDate(
                            context,
                            DateTime(2024),
                            DateTime.now().add(const Duration(days: 365)));
                           
                        if (result != null) {
                          calenderController.dateDifference.value = result!.duration.inDays;
                          calenderController.startingDate.value =
                              result!.start.toString().split(" ")[0];
                          calenderController.endDate.value =
                              result!.end.toString().split(" ")[0];
                        //  ApiServices.postBookedDates(rentalData.propertyId, result?.start);
                          calenderController.update();
                        }
                     
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: screenHeight * .06,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.teal),
                        child: const Text(
                          "Check Availability",
                          style: btnText,
                        ),
                      ),
                    ),

          
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


