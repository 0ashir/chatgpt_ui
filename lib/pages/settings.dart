//main page of settings
import 'package:chat_gpt/utilis/themes.dart';
import 'package:chat_gpt/widgets/setting_widgets/expected_output.dart';
import 'package:chat_gpt/widgets/setting_widgets/output_length.dart';
import 'package:chat_gpt/widgets/setting_widgets/sentiment.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

//clas for taking output format value and status
class Items {
  final String title;
  bool isSelected;
  Items({required this.title, this.isSelected = false});
}

//sentiment class
class Sentiment {
  final String title;
  bool isSelected;
  Sentiment({required this.title, this.isSelected = false});
}

class OutputSettings extends StatefulWidget {
  const OutputSettings({Key? key}) : super(key: key);
  //list containing the expected output values
  static final List<Items> expectedOutput = [
    Items(title: 'Default', isSelected: true),
    Items(title: 'Paragraph'),
    Items(title: 'List'),
    Items(title: 'Headings'),
    Items(title: 'Essay'),
    Items(title: 'Speech')
  ];

  //list containing sentiment values
  static final List<Sentiment> sentiment = [
    Sentiment(title: 'Positive', isSelected: true),
    Sentiment(title: 'Negative'),
    Sentiment(title: 'Neutral'),
    Sentiment(title: 'Mixed'),
  ];
  static double defaultLength = 500.0; //in characters

  @override
  State<OutputSettings> createState() => _OutputSettingsState();
}

class _OutputSettingsState extends State<OutputSettings> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          title: "Output Settings"
              .text
              .fontFamily('Lato')
              .color(MyTheme.darkThemeText)
              .make()),
      body: Column(children: [
        //parent container on the screen
        Align(
          alignment: Alignment.topCenter, //specifying area we want to use

          child: Container(
            width: screenSize.width * 0.9,
            height: screenSize.height * 0.67,
            margin: EdgeInsets.only(top: screenSize.height * 0.047),
            decoration: BoxDecoration(
              color: context.cardColor,
              borderRadius: BorderRadius.circular(30.0),
            ),

            //content showing on setting screen
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //contents alignment
              children: [
                SizedBox(height: screenSize.height * 0.03),

                ExpectedOutput(
                    expected:
                        OutputSettings.expectedOutput), //expected output class
                //output length class
                ContentSentiment(sentiment: OutputSettings.sentiment),
                OutputLength(
                  defaultLength: OutputSettings.defaultLength,
                ), //sentiment class
              ],
            ),
          ),
        ),

        //code for buttons
        Container(
          width: screenSize.width * 0.9,
          margin: EdgeInsets.only(top: screenSize.height * 0.03),

          child:
              ButtonBar(alignment: MainAxisAlignment.spaceBetween, children: [
            //defualt settings button
            InkWell(
              onTap: () {
                setState(() {
                  OutputSettings.defaultLength = 500.0;

                  //setting default value for expected output
                  for (int i = 0;
                      i < OutputSettings.expectedOutput.length;
                      i++) {
                    if (i == 0) {
                      OutputSettings.expectedOutput[i].isSelected = true;
                    } else {
                      OutputSettings.expectedOutput[i].isSelected = false;
                    }
                  }
                  //setting defualt value for sentiment
                  for (int i = 0; i < OutputSettings.sentiment.length; i++) {
                    if (i == 0) {
                      OutputSettings.sentiment[i].isSelected = true;
                    } else {
                      OutputSettings.sentiment[i].isSelected = false;
                    }
                  }
                });
              },
              child: Container(
                  width: screenSize.width * 0.4,
                  height: screenSize.height * 0.055,
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonTheme.colorScheme?.primary,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: 'DEFAULT SETTINGS'
                      .text
                      .fontFamily('Lato')
                      .semiBold
                      .color(MyTheme.darkThemeText)
                      .makeCentered()),
            ),

            //change settings button
            InkWell(
                onTap: () {
                  //showing popup notifi
                  const snackbar = SnackBar(content: Text("Settings Change"));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  //will get values from here when we have api key
                },
                child: Container(
                    width: screenSize.width * 0.4,
                    height: screenSize.height * 0.055,
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonTheme.colorScheme?.primary,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: 'CHANGE SETTINGS'
                        .text
                        .semiBold
                        .fontFamily('Lato')
                        .color(MyTheme.darkThemeText)
                        .makeCentered()))
          ]), //buttons class
        ),
      ]),
    );
  }
}
