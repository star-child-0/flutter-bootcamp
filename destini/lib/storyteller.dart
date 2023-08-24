import "story.dart";

class StoryTeller{
  int _current = 0;
  final int _end = -1;
  final List<Story> _story = [
    Story(
      story: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'.",
      choice1: "I'll hop in. Thanks for the help!",
      next1: 2,
      choice2: "Better ask him if he's a murderer first.",
      next2: 1
    ),
    Story(
      story: "He nods slowly, unphased by the question.",
      choice1: "At least he's honest. I'll climb in.",
      next1: 2,
      choice2: "Wait, I know how to change a tire.",
      next2: 3
    ),
    Story(
      story: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
      choice1: "I love Elton John! Hand him the cassette tape.",
      next1: 5,
      choice2: "It's him or me! You take the knife and stab him.",
      next2: 4
    ),
    Story(
      story: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
      choice1: "Restart",
      next1: -1,
      choice2: "",
      next2: -1
    ),
    Story(
      story: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
      choice1: "Restart",
      next1: -1,
      choice2: "",
      next2: -1
    ),
    Story(
      story: "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier'.",
      choice1: "Restart",
      next1: -1,
      choice2: "",
      next2: -1,
    )
  ];

  StoryTeller();

  void nextStory(choice){
    _current = choice == 1 ? _story[_current].next1 : _story[_current].next2;
  }

  bool shouldButtonBeVisible(){
    List<int> arr = [0, 1, 2];
    return arr.contains(_current) ? true : false;
  }

  bool lastStory(){
    return _story[_current].next1 == _end || _story[_current].next2 == _end ? true : false;
  }

  void restart(){
    _current = 0;
  }

  String getStory(){
    return _story[_current].story;
  }

  String getChoice1(){
    return _story[_current].choice1;
  }

  String getChoice2(){
    return _story[_current].choice2;
  }
}
