//content on the mainpage
import 'package:chat_gpt/utilis/routes.dart';
import 'package:chat_gpt/utilis/themes.dart';
import 'package:chat_gpt/utilis/myfunctions.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

//class containing the mainPage content
class MainContent extends StatelessWidget {
  //constructor
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    //getting size of screen
    final screenSize = MediaQuery.of(context).size;

    //creating instance of the getter of the captionsFunction
    String caption = getCaption;

    //all content here
    return Column(children: [
      //space between appbar and image
      SizedBox(
        height: screenSize.height * 0.04,
      ),

      // main image
      Image(
        image: const AssetImage('assets/Images/blackRobot.png'),
        width: screenSize.width * 0.85,
        height: screenSize.height * 0.5,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.medium,
      ),

      //main heading
      Container(
        child: "AI ChatBot"
            .text
            .xl5
            .fontFamily('Lato')
            .color(MyTheme.darkThemeText)
            .make()
            .pOnly(top: screenSize.height * 0.08)
            .centered(),
      ),

      //caption here
      Container(
        margin: Vx.m12,
        child: caption.text
            .align(TextAlign.center)
            .fontFamily('Lato')
            .color(Colors.white38)
            .make()
            .pOnly(
                left: screenSize.width * 0.02, right: screenSize.width * 0.02)
            .centered(),
      ),

      //start chat buttoN
      InkWell(
          onTap: () =>
              //moving to homepage when button is clicked
              Navigator.pushNamed(context, MyRoutes.homeRoute),
          child: Container(
              width: screenSize.width * 0.5,
              height: screenSize.height * 0.05,
              margin: Vx.mOnly(top: 5.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).buttonTheme.colorScheme?.primary,
                  borderRadius: BorderRadius.circular(15.0)),
              child: "Start Chat"
                  .text
                  .xl
                  .fontFamily('Lato')
                  .semiBold
                  .color(MyTheme.darkThemeText)
                  .makeCentered())),
    ]);
  }
}
