import 'package:flutter/material.dart';

import '../utils/colors_code.dart';
import '../utils/styles.dart';

class CustomLabelDecrationField extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  // final style;

  const CustomLabelDecrationField({
    super.key,
    required this.text,
  });
  @override
  // ignore: library_private_types_in_public_api
  _CustomLabelFieldState createState() => _CustomLabelFieldState();
}

class _CustomLabelFieldState extends State<CustomLabelDecrationField> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Padding(
      //  padding: const EdgeInsets.only(left: 22, right: 22, bottom: 2),
      padding:  EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: ColorsCode.text_border_color,
            ),
            color: const Color(0xffFFFFFF),
            //
            //E9F2F2
            borderRadius: BorderRadius.circular(6),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 1),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("  ${widget.text}", style: Style.alltext_default_balck),
            ],
          ),
        ),
      ),
    );
  }
}
