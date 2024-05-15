import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jayga_app/routes/routes_name.dart';
import 'package:jayga_app/screens/home%20screen/home%20screen%20widgets/categoryTabwidget.dart';
import 'package:jayga_app/screens/home%20screen/home%20screen%20widgets/contentDivider.dart';
import 'package:jayga_app/screens/home%20screen/home%20screen%20widgets/customAppbar.dart';
import 'package:jayga_app/screens/home%20screen/home%20screen%20widgets/rentalList.dart';
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
                //--- AppBar Section ---- //
                CustomAppbar(
                    screenHeight: screenHeight, screenWidth: screenWidth),
                //--- SpanText Section ---- //
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: RichText(
                    text: const TextSpan(
                        text: "Find your next \n",
                        style: titleText,
                        children: [
                          TextSpan(text: "place ", style: spanText),
                          TextSpan(text: "to stay")
                        ]),
                  ),
                ),
                //--- SearchWidget Section ---- //
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    cursorColor: contentColor,
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
                //--- Divider Section ---- //
                const ContentDivider(),
                //--- Content Text Section ---- //
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

                //--- Category Tab Section ---- //
                CategoryTabWidget(
                    screenHeight: screenHeight, screenWidth: screenWidth),
                SizedBox(
                  height: screenHeight * .03,
                ),

                //--- Rent info---- //
                Obx(
                  () => rentalListController.isLoading.value == false
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var rentaData =
                                rentalListController.fitlerListData[index];
                            return InkWell(
                              onTap: () {
                              //--- Passing indexing data to datils screen --- // 
                                Get.toNamed(RoutesName.detailsScreen,
                                    arguments: {"indexData": rentaData});
                              },

                              //--- List of Rental Section ---- //
                              child: RentalList(
                                  screenHeight: screenHeight,
                                  rentaData: rentaData),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: screenHeight * .05);
                          },
                          itemCount: rentalListController.fitlerListData.length)
                      : const Center(
                          child: CircularProgressIndicator(
                            color: contentColor,
                            backgroundColor: Colors.black,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
