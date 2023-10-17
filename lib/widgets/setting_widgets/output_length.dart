import 'package:chat_gpt/pages/settings.dart';
import 'package:chat_gpt/utilis/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OutputLength extends StatefulWidget {
  const OutputLength({super.key, required this.defaultLength});
  final double defaultLength;
  @override
  State<OutputLength> createState() => OutputLengthState();
}

class OutputLengthState extends State<OutputLength> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(right: screenSize.width * 0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //length heading
                Container(
                    child: 'OUTPUT LENGTH'
                        .text
                        .fontFamily('Lato')
                        .lg
                        .letterSpacing(1.1)
                        .color(MyTheme.darkThemeText)
                        .make()
                        .p16()),
                //number of char
                Container(
                    child: "${OutputSettings.defaultLength.toInt()} char"
                        .text
                        .fontFamily('Lato')
                        .color(MyTheme.darkThemeText)
                        .letterSpacing(1.1)
                        .make())
              ],
            )),

        //slider here
        Container(
          width: screenSize.width * 0.9,
          margin: EdgeInsets.only(right: screenSize.width * 0.08),
          child: Slider(
              value: OutputSettings.defaultLength,
              min: 50.0,
              max: 1000.0,
              activeColor: Colors.white12,
              inactiveColor: Colors.white10,
              onChanged: (newValue) {
                setState(() {
                  OutputSettings.defaultLength = newValue;
                });
              }),
        ),
      ],
    );
  }
}
