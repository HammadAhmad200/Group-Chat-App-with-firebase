import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled/helper/functionhelper.dart';
import 'package:untitled/pages/homepage.dart';
import 'package:untitled/pages/loginpage.dart';
import 'package:untitled/shared/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(
        apiKey: constants.apiKey,
        authDomain: constants.authDomain,
        projectId: constants.projectId,
        storageBucket:constants.storageBucket ,
        messagingSenderId: constants.messagingSenderId,
        appId: constants.appId));
  }else{
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isSignedIn = false;
  @override
  void initState(){
    super.initState();
    getuserLoggedInstatus();
  }
  getuserLoggedInstatus() async{
  await functionhelper.getuserLoggedInStatus().then((value){
    if(value!=null){
      setState(() {
        isSignedIn = value;
      });
    }
  });
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: constants().primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home:isSignedIn ? const Homepage():const LogInPage(),
    );
  }
}
