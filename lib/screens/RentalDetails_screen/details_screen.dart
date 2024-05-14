import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jayga_app/screens/RentalDetails_screen/controller/calander_controller.dart';
import 'package:jayga_app/screens/RentalDetails_screen/widgets/rentalDetailsBody.dart';
import 'package:jayga_app/models/rentalModel.dart';
import 'package:jayga_app/utils/constants/color.dart';


class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {

    // controller instance for state M.
    final calenderController = Get.put(CalenderController());

    //responsive screenSize instance
    double screenHeight = MediaQuery.of(context).size.height;

     //collecting arguments data from previous screen//
    RentalsModel rentalData = Get.arguments['indexData'];

    //Converting dates into init formates
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
                // Rental Details info Section //
                child: RentalDetailsBody(rentalData: rentalData, availableFrom: availableFrom, availableFromTime: availableFromTime, availableUntil: availableUntil, availableUntilTime: availableUntilTime, calenderController: calenderController, screenHeight: screenHeight),
              ),
            ),
          )
        ],
      ),
    );
  }
}

