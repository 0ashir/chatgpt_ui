import 'package:chat_gpt/utilis/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class HomeAppBar extends StatelessWidget {
  //callback function which rebuilds the UI when list is clear
  final VoidCallback onIconPressed;
  // variable which contains screensize
  late Size _screenSize;

  HomeAppBar({super.key, required this.onIconPressed});

  @override
  Widget build(BuildContext context) {
    //getting screnSize here
    _screenSize = MediaQuery.of(context).size;

    return AppBar(
        //adding back button
        automaticallyImplyLeading: true,
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: _screenSize.width * 0.5,
              child: "ChatBot"
                  .text
                  .fontFamily('Lato')
                  .color(MyTheme.darkThemeText)
                  .xl2
                  .make(),
            ),
            //new chat icon here
            InkWell(
              onTap: () => onIconPressed(),
              child: Container(
                  width: _screenSize.width * 0.21,
                  height: _screenSize.height * 0.035,
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonTheme.colorScheme?.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: "New Chat"
                      .text
                      .color(MyTheme.darkThemeText)
                      .sm
                      .makeCentered()
                      .pOnly(top: _screenSize.height * 0.001)),
            )
          ],
        ));
  }
}
