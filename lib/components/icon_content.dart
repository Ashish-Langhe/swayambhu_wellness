import 'package:flutter/cupertino.dart';
import '../utils/constants.dart';


class IconContent extends StatelessWidget {
  final IconData genderIcon;
  final String genderText;

  IconContent({required this.genderIcon, required this.genderText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 60.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
