import 'package:chat_gpt/pages/settings.dart';
import 'package:chat_gpt/utilis/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ContentSentiment extends StatefulWidget {
  const ContentSentiment({super.key, required this.sentiment});
  final List<Sentiment> sentiment;

  @override
  State<ContentSentiment> createState() => ContentSentimentState();
}

class ContentSentimentState extends State<ContentSentiment> {
  //function use when default button is click

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
        child: Column(
      children: [
        //SENTIMENT heading
        Container(
          width: screenSize.width * 0.6,
          height: screenSize.height * 0.03,
          margin: EdgeInsets.only(
              top: screenSize.width * 0.065, right: screenSize.width * 0.13),
          child: "CONTENT SENTIMENT"
              .text
              .fontFamily('Lato')
              .color(MyTheme.darkThemeText)
              .xl
              .letterSpacing(1.1)
              .make(),
        ),

        //container use for setting the area for gridview.builder
        Container(
          //setting space for the list values
          height: screenSize.height * 0.1,
          width: screenSize.width * 0.8,

          margin: EdgeInsets.only(top: screenSize.height * 0.005),
          padding: EdgeInsets.only(
              top: screenSize.height * 0.02, left: screenSize.width * 0.05),

          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1, //width
              mainAxisExtent: screenSize.height * 0.05, //height
              mainAxisSpacing: screenSize.height * 0.01, //vertical spacing
              crossAxisSpacing: screenSize.width * 0.015,
            ),
            itemCount: OutputSettings.sentiment.length,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                  onTap: () {
                    //selecting one and unselecting all other values
                    setState(() {
                      for (int i = 0;
                          i < OutputSettings.sentiment.length;
                          i++) {
                        if (i == index) {
                          OutputSettings.sentiment[i].isSelected = true;
                        } else {
                          OutputSettings.sentiment[i].isSelected = false;
                        }
                      }
                    });
                  },
                  //values displayed on screen
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: OutputSettings.sentiment[index].isSelected
                          ? Theme.of(context).buttonTheme.colorScheme?.primary
                          : null,
                      border: Border.all(
                        width: 1.0,
                        color: const Color.fromARGB(255, 9, 9, 10),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: OutputSettings.sentiment[index].title.text
                        .fontFamily('Lato')
                        .color(MyTheme.darkThemeText)
                        .makeCentered(),
                  ));
            },
          ),
        )
      ],
    )
    );
  }
}
