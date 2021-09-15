import 'package:flutter/material.dart';
import 'package:storyapp/story_brain.dart';

void main() => runApp(StoryApp());

class StoryApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain brain = StoryBrain();
class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://raw.githubusercontent.com/londonappbrewery/destini-challenge-starting/master/images/background.png'),
                  fit: BoxFit.fill,
            )
          ),

        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    brain.getStory(),
                    style: TextStyle(
                      fontSize: 21.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    brain.nextStory(1);
                    setState(() {
                      brain.nextStory(1);
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    brain.getChoice1(),
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                visible:  brain.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      brain.nextStory(2);
                      setState(() {
                        brain.nextStory(2);
                      });

                    },
                    color: Colors.blue,
                    child: Text(
                      brain.getChoice2(),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
