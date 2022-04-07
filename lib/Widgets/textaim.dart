import 'package:lib_system/Widgets/responsive.dart';
import 'package:flutter/material.dart';

class TextAim extends StatelessWidget {
  const TextAim({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.65,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child:  Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Aim',
            style: TextStyle(
                fontSize: 36,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color:Color(0xFF077bd7)
            ),
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Text(
              'Jimma Institute of Technology Library (JITL) wants to introduce a new website that checks new books available, research papers, and plagiarism checking systems by sending your full information with a book title, research title with other descriptions, and pdf file only for checking plagiarism. And finally, we will respond to your request using your email address.',
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
