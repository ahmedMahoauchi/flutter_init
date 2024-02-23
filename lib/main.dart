import 'package:flutter/material.dart';
import 'package:machines_talk_init/viewmodels/dtails_viewmodel.dart';
import 'package:machines_talk_init/viewmodels/textField_viewmodel.dart';
import 'package:machines_talk_init/views/map_screen.dart';
import 'package:machines_talk_init/views/textField_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/home_screen.dart';
import 'views/details_screen.dart';
import 'viewmodels/home_viewmodel.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    sharedPreferences: prefs,
  ));
}

class MyApp extends StatelessWidget {

  final SharedPreferences sharedPreferences;

  MyApp({required this.sharedPreferences});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel(sharedPreferences)),
        ChangeNotifierProvider(create: (context) => DetailsViewModel(sharedPreferences)),
        ChangeNotifierProvider(create: (context) => TextFieldViewModel(sharedPreferences)),
      ],
      child: MaterialApp(
        title: 'Two Screen Communication',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/details': (context) => DetailsScreen(),
          '/textField': (context) => TextFieldScreen(),
          '/mapScreen': (context) => MapScreen(),
        },
      ),
    );
  }
}
