import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jayga_app/screens/home%20screen/constants/catagory_data.dart';
import 'package:jayga_app/screens/home%20screen/controller/category_controller.dart';
import 'package:jayga_app/utils/constants/color.dart';

class CategoryTabWidget extends StatelessWidget {
  const CategoryTabWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (controller) => SizedBox(
        height: screenHeight * .080,
        width: double.infinity,
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var data = catagoryData[index];

              return InkWell(
                onTap: () {
                  controller.changeCatagoryIndex(index);
                },
                child: Container(
                  width: screenWidth * .204,
                  decoration: BoxDecoration(
                      color: controller.selectedCatagoryIndex == index
                          ? contentColor
                          : bgColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          data.icon,
                          cacheHeight: 20,
                          cacheWidth: 20,
                          color: controller.selectedCatagoryIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                        Text(
                          data.title,
                          overflow: TextOverflow.ellipsis, //maxLines: 1,
                          style: TextStyle(
                              color: controller.selectedCatagoryIndex == index
                                  ? Colors.white
                                  : Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: screenWidth * .03,
              );
            },
            itemCount: catagoryData.length),
      ),
    );
  }
}

