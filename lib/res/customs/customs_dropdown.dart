import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../utils/colors_code.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    this.baseColor,
    this.borderColor,
    this.errorColor,
    this.tittleValue,
    this.onChangeButton,
    this.destination,
    this.tittle,
    this.titleList,
    this.style,
    this.onChanged,
  });
  final Color? baseColor;
  final Color? borderColor;
  final Color? errorColor;
  final String? tittleValue;
  // ignore: prefer_typing_uninitialized_variables
  final onChangeButton;
  final String? destination;
  final String? tittle;
  final List? titleList;
  // ignore: prefer_typing_uninitialized_variables
  final style;

  // final Function? validator;
  final Function? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 0),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .16,
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 0.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: ColorsCode.text_border_color, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  //  buttonWidth: 100,
                  //dropdownWidth: 111,

                  hint: tittleValue == ""
                      ? Padding(
                          padding: const EdgeInsets.only(left: 0, right: 0),
                          child: Text(
                            tittle.toString(),
                            style: style,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 0, right: 0),
                          child: Text(
                            tittleValue.toString(),
                            style: style, //background: #3BE4C6;
                          ),
                        ),
                  //isExpanded: true,

                  isExpanded: true,
                  // icon: Icon(
                  //   Icons.arrow_drop_down,
                  //   color: ColorsCode.primary_color,
                  // ),

                  items: titleList!.map(
                    (val) {
                      return DropdownMenuItem<String>(
                          value: val, child: Text(val));
                    },
                  ).toList(),
                  onChanged: (val) {
                    onChangeButton.selectFromDropDown(
                        val.toString(), destination);
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
