// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jayga_app/routes/routes_name.dart';
// import 'package:jayga_app/screens/home%20screen/models/rentalsListModel.dart';
// import 'package:jayga_app/utils/constants/text_style.dart';

// class RentalListTile extends StatelessWidget {
//   final AsyncSnapshot<List<RentalsListModel>> snapshotData;



//    const RentalListTile(
//       {super.key, required this.screenHeight, required this.snapshotData,});

//   final double screenHeight;
 
 

//   @override
//   Widget build(BuildContext context) {
//     return 
//     ListView.separated(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           var rentaData = snapshotData.data![index];
//           return InkWell(
//             onTap: () {
//               Get.toNamed(RoutesName.detailsScreen,
//                   arguments: {"indexData": rentaData});
//             },
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       height: screenHeight * .3,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: NetworkImage("${rentaData.rentSpaceImg}"),
//                               fit: BoxFit.fill),
//                           // color: Colors.red,
//                           borderRadius: BorderRadius.circular(30)),
//                     ),
//                     const Positioned(
//                         top: 19,
//                         left: 24,
//                         child: Icon(
//                           Icons.favorite_border_rounded,
//                           color: Colors.white,
//                           size: 30,
//                         ))
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 SizedBox(
//                   //color: Colors.green,
//                   height: screenHeight * .14,
//                   width: double.infinity,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //Tile Section and Rating Section ----- ///
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "${rentaData.title}",
//                             style: bodyTileText,
//                           ),
//                           const Row(
//                             children: [
//                               Icon(
//                                 Icons.star,
//                                 color: Colors.yellow,
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Text("5.0")
//                             ],
//                           ),
//                         ],
//                       ),

//                       //Per night Stay Section -----//
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "${rentaData.address}, ${rentaData.city}",
//                             style: locationTextStyle,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Bedrooms-${rentaData.bedrooms} + Bathrooms-${rentaData.bathrooms}",
//                                 style: roomCountTextStyle,
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "৳${rentaData.rentalPerNight}",
//                                     style: perNightStyle,
//                                   ),
//                                   const Text("/night"),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       //Short Stay Section------//
//                       rentaData.shortStay == true
//                           ? Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Row(
//                                   children: [
//                                     Text(
//                                       "Short Stay",
//                                       style: slotAvailableText,
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text(
//                                       "available",
//                                       style: TextStyle(
//                                           fontSize: 14,
//                                           fontFamily: "Public_Sans",
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       "৳${rentaData.slotRent}",
//                                       style: perslotStyle,
//                                     ),
//                                     const Text("/slot"),
//                                   ],
//                                 ),
//                               ],
//                             )
//                           : Container(),

//                       Container(
//                         height: screenHeight * .01,
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//         separatorBuilder: (context, index) {
//           return SizedBox(height: screenHeight * .05);
//         },
//         itemCount:snapshotData.data!.length );
  
//   }
// }
