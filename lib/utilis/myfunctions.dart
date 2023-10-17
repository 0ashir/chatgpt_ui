import 'dart:math';

//this function is used in the main_content file
//it gives the random caption from the list everytime it is called
String captionIdea() {
  List<String> captions = [
    "Talk to me and let's explore the world of AI together!",
    "I'm here to help you ask me 24/7. Ask me anything!",
    "I'm always learning and improving. Let's chat!",
    "Talk to me and I will do my best to understand.",
    "Chat with me and explore the possibilites of AI",
    "Talk to me and let me insist you in your endeavors!",
    "I'm here to help! Just tell me what's on your mind.",
    "I'm always here to chat! What's on your mind today?",
  ];
  //  this line creates the random_index and get the caption from list on that index
  int randomIndex = Random().nextInt(captions.length);
  return captions[randomIndex];
}

String get getCaption => captionIdea();


