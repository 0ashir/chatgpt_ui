//MainPage
import 'package:chat_gpt/pages/homepage.dart';
import 'package:chat_gpt/pages/settings.dart';
import 'package:chat_gpt/utilis/themes.dart';
import 'package:chat_gpt/utilis/routes.dart';
import 'package:chat_gpt/widgets/mainpage_widgets/main_appbar.dart';
import 'package:chat_gpt/widgets/mainpage_widgets/main_content.dart';
import 'package:flutter/material.dart';

// main function of app
void main() {
  runApp(const ChatGPT());
}

//creating state for the class ChatGPT
class ChatGPT extends StatefulWidget {
  const ChatGPT({Key? key}) : super(key: key);

  @override
  State<ChatGPT> createState() => _ChatGPTState();
}

//class which contains materialApp
//this class set theme and routes of the app and contain primaryclass as child
class _ChatGPTState extends State<ChatGPT> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //setting theme which applies on the whole app
      theme: MyTheme.darkTheme(context),

      //hide debug banner
      debugShowCheckedModeBanner: false,

      //page to be open when app run
      initialRoute: "/",

      //routes to the pages
      routes: {
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.settingsRoute: (context) => const OutputSettings()
      },
      // the class below contains the content of our main page
      home: const PrimaryClass(),
    );
  }
}

// creating state for the primary class
class PrimaryClass extends StatefulWidget {
  const PrimaryClass({Key? key}) : super(key: key);

  @override
  State<PrimaryClass> createState() => _PrimaryClassState();
}

//it contains all the subclasses of the mainpage
class _PrimaryClassState extends State<PrimaryClass> {
  //build function of the class
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    //listens to ValueListenable and rebuild the child widget tree whenever the value changes
    //it rebuilds whenever the screenSize changes
    return SafeArea(
      minimum: EdgeInsets.only(top: screenSize.height * 0.04),
      child: const Scaffold(
        //setting size of the appBar, needed when calling custom Appbar
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          //calling the custom appbar
          child: MainAppBar(),
        ),
        //this class contains the contents of the mainpage
        body: MainContent(),
      ),
    );
  }
}
