import 'package:flutter/material.dart';
import 'package:jayga_app/models/rentalModel.dart';
import 'package:jayga_app/utils/constants/text_style.dart';

class RentalList extends StatelessWidget {
  const RentalList({
    super.key,
    required this.screenHeight,
    required this.rentaData,
  });

  final double screenHeight;
  final RentalsModel rentaData;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          const Text("/ night"),
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
                            const Text("/ slot"),
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
    );
  }
}