import 'package:flutter/material.dart';

class ContentDivider extends StatelessWidget {
  const ContentDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 3.0),
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: Divider(),
          ),
          Spacer(),
          Text("or"),
          Spacer(),
          Expanded(
            flex: 9,
            child: Divider(),
          )
        ],
      ),
    );
  }
}
