import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  final numberFilter = TextEditingController();
  List users = ['Yusef', 'John', 'Sarah'];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    numberFilter.dispose();
    super.dispose();
  }

  String printList(List stuff, int number) {
    String result = 'These are the users: \n';
    if (number <= stuff.length) {
      for (int i = 0; i <= number - 1; i++) {
        result += stuff[i] + '\n';
      }
      return result;
    } else {
      return 'Give me a better number pls :)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Successful Login!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Welcome Back YUSEF \n' + 'It is nice to see you again :)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: TextField(
                  controller: numberFilter,
                  decoration: new InputDecoration(labelText: 'Number'),
                ),
              ),
            ),
            FloatingActionButton(
              // When the user presses the button, show an alert dialog containing
              // the text that the user has entered into the text field.
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                      content:
                          Text(printList(users, int.parse(numberFilter.text))),
                    );
                  },
                );
              },
              tooltip: 'Show me the value!',
              child: Icon(Icons.text_fields),
            ),
            Image.asset(
              'images/smile.png',
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
