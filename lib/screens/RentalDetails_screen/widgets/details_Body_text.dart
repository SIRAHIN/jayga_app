import 'package:flutter/widgets.dart';

class DetailsBodyText extends StatelessWidget {
  final String tText;
  final TextStyle? textStyle;
  const DetailsBodyText({super.key, required this.tText, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      tText,
      style: textStyle,
    );
  }
}