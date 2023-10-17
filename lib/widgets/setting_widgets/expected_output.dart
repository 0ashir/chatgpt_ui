import 'package:chat_gpt/pages/settings.dart';
import 'package:chat_gpt/utilis/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ExpectedOutput extends StatefulWidget {
  const ExpectedOutput({super.key, required this.expected});
  final List<Items> expected;
  @override
  State<ExpectedOutput> createState() => _ExpectedOutputState();
}

class _ExpectedOutputState extends State<ExpectedOutput> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
        child: Column(
      children: [
        //EXPECTED OUTPUT heading container
        Container(
          width: screenSize.width * 0.4,
          height: screenSize.height * 0.03,
          margin: EdgeInsets.only(
              top: screenSize.width * 0.1, right: screenSize.width * 0.33),
          child: "EXPECTED OUTPUT"
              .text
              .fontFamily('Lato')
              .color(MyTheme.darkThemeText)
              .lg
              .letterSpacing(1.1)
              .make(),
        ),

        //this container is used for setting the area for gridview.builder
        Container(
          // color: Colors.yellow,
          //setting space for the list values
          height: screenSize.height * 0.15,
          width: screenSize.width * 0.8,

          margin: EdgeInsets.only(top: screenSize.height * 0.01),
          padding: EdgeInsets.only(
              top: screenSize.height * 0.02, left: screenSize.width * 0.05),

          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1, //width
              mainAxisExtent: screenSize.height * 0.05, //height
              mainAxisSpacing: screenSize.height * 0.01, //vertical spacing
              crossAxisSpacing: screenSize.width * 0.02, //horizontal spacing
            ),
            itemCount: OutputSettings.expectedOutput.length,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                  onTap: () {
                    //selecting one value and unselecting all others
                    setState(() {
                      for (int i = 0;
                          i < OutputSettings.expectedOutput.length;
                          i++) {
                        if (i == index) {
                          OutputSettings.expectedOutput[i].isSelected = true;
                        } else {
                          OutputSettings.expectedOutput[i].isSelected = false;
                        }
                      }
                    });
                  },
                  //list showing on the screen
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: OutputSettings.expectedOutput[index].isSelected
                          ? Theme.of(context).buttonTheme.colorScheme?.primary
                          : null,
                      border: Border.all(
                        width: 1.0,
                        color: const Color.fromARGB(255, 9, 9, 10),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: OutputSettings.expectedOutput[index].title.text
                        .color(MyTheme.darkThemeText)
                        .fontFamily('Lato')
                        .makeCentered(),
                  ));
            },
          ),
        )
      ],
    ));
  }
}
