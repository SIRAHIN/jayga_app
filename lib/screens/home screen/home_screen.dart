import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jayga_app/routes/routes_name.dart';
import 'package:jayga_app/screens/home%20screen/home%20screen%20widgets/categoryTabwidget.dart';
import 'package:jayga_app/screens/home%20screen/home%20screen%20widgets/contentDivider.dart';
import 'package:jayga_app/screens/home%20screen/home%20screen%20widgets/customAppbar.dart';
import 'package:jayga_app/utils/constants/assets_paths.dart';
import 'package:jayga_app/utils/constants/color.dart';
import 'package:jayga_app/utils/constants/text_style.dart';
import 'package:jayga_app/screens/home%20screen/controller/category_controller.dart';
import 'package:jayga_app/screens/home%20screen/controller/rental_list_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final catagoryController = Get.put(CategoryController());
  final rentalListController = Get.put(RentalListController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                    screenHeight: screenHeight, screenWidth: screenWidth),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: RichText(
                    text: const TextSpan(
                        text: "Find you next \n",
                        style: titleText,
                        children: [
                          TextSpan(text: "palce ", style: spanText),
                          TextSpan(text: "to stay")
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    onChanged: (value) {
                      rentalListController.filterPlayer(value);
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Image.asset(
                        searchIcon,
                        cacheHeight: 14,
                        cacheWidth: 14,
                      ),
                      prefixIconColor: primaryColor,
                      suffixIcon: Image.asset(
                        filterIcon,
                        cacheHeight: 14,
                        cacheWidth: 14,
                      ),
                      hintText: "Search for places",
                      hintStyle: hintText,
                      fillColor: fillColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
                const ContentDivider(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                  child: Center(
                    child: Text(
                      "Find all listings near your area",
                      style: contentText,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenWidth * .05,
                ),
                CategoryTabWidget(
                    screenHeight: screenHeight, screenWidth: screenWidth),
                SizedBox(
                  height: screenHeight * .03,
                ),
               
                     Obx(
                        () =>  rentalListController.isLoading.value == false ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              var rentaData =
                                  rentalListController.fitlerListData[index];
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(RoutesName.detailsScreen,
                                      arguments: {"indexData": rentaData});
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: screenHeight * .3,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${rentaData.rentSpaceImg}"),
                                                  fit: BoxFit.fill),
                                              // color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                        const Positioned(
                                            top: 19,
                                            left: 24,
                                            child: Icon(
                                              Icons.favorite_border_rounded,
                                              color: Colors.white,
                                              size: 30,
                                            ))
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      //color: Colors.green,
                                      height: screenHeight * .14,
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //Tile Section and Rating Section ----- ///
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${rentaData.title}",
                                                style: bodyTileText,
                                              ),
                                              const Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("5.0")
                                                ],
                                              ),
                                            ],
                                          ),

                                          //Per night Stay Section -----//
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${rentaData.address}, ${rentaData.city}",
                                                style: locationTextStyle,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Bedrooms-${rentaData.bedrooms} + Bathrooms-${rentaData.bathrooms}",
                                                    style: roomCountTextStyle,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "৳${rentaData.rentalPerNight}",
                                                        style: perNightStyle,
                                                      ),
                                                      const Text("/night"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          //Short Stay Section------//
                                          rentaData.shortStay == true
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Row(
                                                      children: [
                                                        Text(
                                                          "Short Stay",
                                                          style:
                                                              slotAvailableText,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "available",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  "Public_Sans",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "৳${rentaData.slotRent}",
                                                          style: perslotStyle,
                                                        ),
                                                        const Text("/slot"),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : Container(),

                                          Container(
                                            height: screenHeight * .01,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: screenHeight * .05);
                            },
                            itemCount:
                                rentalListController.fitlerListData.length) : const Center(child: CircularProgressIndicator())
                      ) 
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}
