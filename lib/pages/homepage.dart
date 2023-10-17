//this is the chatpage
import 'package:http/http.dart' as http;
import 'package:chat_gpt/utilis/themes.dart';
import 'package:chat_gpt/widgets/homepage_widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

//creating state for the class
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  //list containing all the messages
  static List<Map<String, dynamic>> messagesList = [
    {
      'text': 'Welcome to the chat',
      'isUser': false,
    }
  ];
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variable which contains screensize
  late Size screenSize;

  //scroll down icon,set to not show
  bool _showScrollIcon = false;

  //used to show the text while user is typing
  final TextEditingController _textController = TextEditingController();

  //create instance for scrolling listview.builder
  final ScrollController _scrollController = ScrollController();

  //called when stateful widget first created
  @override
  void initState() {
    super.initState();
    //adding listener to the scoller of listview
    _scrollController.addListener(_scrollListener);
  }

  //function which contain condition for showing the scroll icon
  void _scrollListener() {
    final pixelsBeforeViewport = _scrollController.position.pixels;
    final pixelsAfterViewport =
        _scrollController.position.maxScrollExtent - pixelsBeforeViewport;
    final viewportHeight = _scrollController.position.viewportDimension;
    final itemsAfterViewport = (pixelsAfterViewport / viewportHeight).ceil();

    setState(
      () {
        //will show the icon for scrolling when _showScrollIcon returns true
        _showScrollIcon = itemsAfterViewport > 0.5;
      },
    );
  } //function ends here

  //updating the list for user input
  updateUserSideList(String userInput) {
    if (userInput.isEmpty) {
      return null;
    } else {
      setState(() {
        HomePage.messagesList.add({
          'text': userInput,
          'isUser': true,
        });
      });
    }
  }

  //function calling the api
  Future<void> fetchResponse() async {
    
    const apiEndpoint = ''; //api endpoint
    try {
      print("tying");
      final response = await http.get(Uri.parse(apiEndpoint));
      print("reached");
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print("Error occured while calling");
        print("Status code is ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  // rebuilds the UI when icon is Pressed
  void onIconPressed() {
    HomePage.messagesList.clear();
    setState(() {
      HomePage.messagesList.add({
        'text': "Let's start a new chat",
        'isUser': false,
      });
    });
  }

  // free up the space
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //getting screnSize here
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      //calling custom appBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HomeAppBar(onIconPressed: onIconPressed),
      ),

      //sizedbox on the wholescreen
      body: SizedBox(
        height: screenSize.height,
        child: Column(
          //stretching the element to cover up the width
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            //messages sectiond
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: HomePage.messagesList.length,
                itemBuilder: (BuildContext context, int index) {
                  //checking that message is from user or server

                  bool isUser = HomePage.messagesList[index]['isUser'];
                  return ListTile(
                    //displaying the messages
                    title: Column(
                      crossAxisAlignment: isUser
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        //container for displaying messages
                        Container(
                          decoration: BoxDecoration(
                              color: isUser
                                  ? Theme.of(context)
                                      .buttonTheme
                                      .colorScheme
                                      ?.primary
                                  : context.cardColor,
                              borderRadius: isUser
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(25.0),
                                      bottomLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(25.0))
                                  : const BorderRadius.only(
                                      topRight: Radius.circular(25.0),
                                      bottomLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(25.0),
                                    )),
                          padding: const EdgeInsets.all(15.0),
                          margin: isUser
                              ? EdgeInsets.only(left: screenSize.width * 0.1)
                              : EdgeInsets.only(
                                  right: screenSize.width * 0.1,
                                  bottom: screenSize.height * 0.02),
                          //text msgs
                          child: "${HomePage.messagesList[index]['text']}"
                              .text
                              .fontFamily('Lato')
                              .color(isUser
                                  ? MyTheme.darkThemeText
                                  : Colors.grey[300])
                              .justify
                              .make(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ), //messages section ends here

            //textfeild and send icon
            //stack is use bcz it allows its child to be verlaid on each other, in our case icon is on the textfield
            Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: screenSize.width * 0.1,
                        height: screenSize.height * 0.06,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 9, 11, 17),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.grey[300],
                          ),
                          controller: _textController,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(right: 30.0),
                              border: InputBorder.none,
                              hintText: 'Type your message...',
                              hintStyle: TextStyle(
                                  fontFamily: 'Lato', color: Colors.grey[300])),
                          maxLines: null,
                        ),
                      ),
                    ),
                  ],
                ),
                //send icon position
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateUserSideList(_textController.text);
                        // updateServerSideList(_textController.text);
                        fetchResponse();
                        _textController.clear();
                      });
                    },
                    child: Container(
                        width: screenSize.width * 0.1,
                        height: screenSize.height * 0.05,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .buttonTheme
                              .colorScheme
                              ?.primary,
                        ),
                        child: const Icon(Icons.send, color: Colors.white)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),

      //icon for scrolling to the bottom
      floatingActionButton: _showScrollIcon
          ? Padding(
              padding: EdgeInsets.fromLTRB(
                  screenSize.width * 0.94, 0, 0, screenSize.height * 0.08),
              child: FloatingActionButton(
                onPressed: () {
                  //function for scrolling
                  _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeOut);
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor:
                    Theme.of(context).buttonTheme.colorScheme?.primary,
                mini: true,
                child: const Icon(Icons.arrow_downward, color: Colors.white),
              ))
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
