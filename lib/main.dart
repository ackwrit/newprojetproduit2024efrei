import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:amazonmini/view/my_background.dart';
import 'package:amazonmini/view/my_login_page.dart';
import 'package:amazonmini/view/my_register_page.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey ="pk_test_51GQ8hTDVXOXIy9UxpbYscBnuiq9FTW63gCk5agdRp2JOjym1NvC03WVaEBdj6wwFkJzAeCit9ZA77sBTeQHaI9rI00fsdMSCog";

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //variable
  int counter = 0;


  //méthode
  Widget choice(){
    switch(counter){
      case 0 : return MyLoginView();
      case 1 : return MyRegisterView();
      default : return Text("Erreur");
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.transparent,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("AminiZone"),
        elevation:0,
        actions:[
          TextButton(
            child : Text("Inscripption",style: TextStyle(color: Colors.black),),
            onPressed:(){
              setState((){
                counter = 1;
              });
            }
          ),
          TextButton(
              child : Text("Connexion",style: TextStyle(color: Colors.black),),
              onPressed:(){
                setState((){
                  counter = 0;
                });
              }
          ),
        ]


      ),
      extendBodyBehindAppBar: true,

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Stack(
          children: [
            MyBackground(),
            Column(
              children: [
                Spacer(),
                Center(
                  child: choice(),
                ),
                Spacer()
              ],
            ),


          ],
        ) ,
      ),
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
