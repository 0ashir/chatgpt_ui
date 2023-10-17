// MainPage AppBar
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:chat_gpt/utilis/routes.dart';


// creating state for the mainBar class
class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

//this is the class for the appbar on main page
class _MainAppBarState extends State<MainAppBar> {

  @override
  Widget build(BuildContext context) {
    //getting size of the screen using provider
    final screenSize = MediaQuery.of(context).size;

    return AppBar(
      //need multiple icons on the appBar, so action is used
      actions: [
        
        //adding space 
        SizedBox(
          width: screenSize.width * 0.8,
          height: 20.0,
        ),
      
        //icon for output settings
        IconButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.settingsRoute),
          icon: const Icon(Icons.settings),
          tooltip: "OutputSettings",
          padding: Vx.mOnly(right: screenSize.width * 0.08),
        ),
      ], //actions ends here
    );
  }
}
