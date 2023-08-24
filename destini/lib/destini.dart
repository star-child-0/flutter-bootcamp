import 'package:flutter/material.dart';

import 'storyteller.dart';

class DestiniPage extends StatefulWidget {
  const DestiniPage({super.key});

  @override
  State<DestiniPage> createState() => _DestiniPageState();
}

class _DestiniPageState extends State<DestiniPage> {
  final StoryTeller _storyTeller = StoryTeller();
  bool _buttonVisibility = true;

  void chooseChoice(choice) {
    if (!_storyTeller.lastStory()){
      setState(() {
        _storyTeller.nextStory(choice);
        _buttonVisibility = _storyTeller.shouldButtonBeVisible();
      });
    }
    else {
      setState(() {
        _storyTeller.restart();
        _buttonVisibility = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 12,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900.withOpacity(0.8),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      _storyTeller.getStory(),
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () => chooseChoice(1),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  _storyTeller.getChoice1(),
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              )
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Visibility(
                visible: _buttonVisibility,
                child: ElevatedButton(
                  onPressed: () => chooseChoice(2),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    _storyTeller.getChoice2(),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              )
            )
          )
        ],
      ),
    );
  }
}
