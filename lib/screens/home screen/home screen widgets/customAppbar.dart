import 'package:flutter/material.dart';
import 'package:jayga_app/utils/constants/assets_paths.dart';
import 'package:jayga_app/utils/constants/text_style.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .05,
      width: double.infinity,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Hello Reza",
            style: bodyText,
          ),
          Row(
            children: [
              Image.asset(
                bellIcon,
                height: 19.95,
                width: 16,
              ),
              SizedBox(
                width: screenWidth * 0.05,
              ),
              Image.asset(
                manuIcon,
                height: 12,
                width: 24,
              )
            ],
          )
        ],
      ),
    );
  }
}
