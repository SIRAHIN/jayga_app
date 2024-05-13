import 'package:flutter/widgets.dart';

class DetailsTileText extends StatelessWidget {
  final String tText;
  final TextStyle? textStyle;
  const DetailsTileText({super.key, required this.tText, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      tText,
      style: textStyle,
    );
  }
}