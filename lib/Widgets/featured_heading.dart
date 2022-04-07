import 'package:lib_system/Widgets/responsive.dart';
import 'package:flutter/material.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: screenSize.width<800?Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured',
            style: TextStyle(
                fontSize: 36,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color:Color(0xFF077bd7)
            ),
          ),
          SizedBox(height: 16,),
          Text(
            'Course that are given in JIT',
            textAlign: TextAlign.end,
          ),
        ],
      ) :Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Text(
              'Featured',
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  color:Color(0xFF077bd7)
              ),
            ),
                Expanded(
                  child: Text(
                    'Course that are given in JIT',
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
    );
  }
}
