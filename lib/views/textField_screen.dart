import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/home_viewmodel.dart';
import '../viewmodels/textField_viewmodel.dart';
import 'myAppBar.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({Key? key});

  @override
  _TextFieldScreenState createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  TextEditingController firstTextFieldController = TextEditingController();
  TextEditingController secondTextFieldController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers to prevent memory leaks
    firstTextFieldController.dispose();
    secondTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textFieldViewModel = Provider.of<TextFieldViewModel>(context);
    return Scaffold(
      appBar: MyAppBar(
        title: "Text Field Screen",
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              // First TextField
              TextField(
                controller: firstTextFieldController,
                decoration: const InputDecoration(
                  labelText: 'First TextField',
                  hintText: 'Enter text here',
                ),
              ),

              SizedBox(height: 16), // Add some vertical space

              // Second TextField
              TextField(
                controller: secondTextFieldController,
                decoration: const InputDecoration(
                  labelText: 'Second TextField',
                  hintText: 'Enter text here',
                ),
              ),

              SizedBox(height: 16), // Add some vertical space

              ElevatedButton(
                onPressed: () async {
                  String firstTextFieldValue = firstTextFieldController.text;
                  String secondTextFieldValue = secondTextFieldController.text;

                  print('First TextField Value: $firstTextFieldValue');
                  print('Second TextField Value: $secondTextFieldValue');


                  await textFieldViewModel.sendPostData(
                    firstTextFieldValue,
                    secondTextFieldValue,
                  );
                },
                child: Text('Get Values'),
              ),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
      Navigator.pushNamed(context, '/mapScreen');
    },
    child: Icon(Icons.map_outlined),
    ),
    );
  }
}
