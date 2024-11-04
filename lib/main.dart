import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
     MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
       primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ));
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  
  Widget build(BuildContext context) {
    return  Scaffold(
     // backgroundColor: Colors.amber,
     appBar:AppBar(
      backgroundColor: Colors.blue,
      title: const Text('Home'),
     ),
      body:FutureBuilder(
        future: Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform,
         ),
        builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.done) {
           final user = FirebaseAuth.instance.currentUser;
           if( user?.emailVerified ?? false){
            print('Your are verified user');
           }else{
            print('You need verify  your email first');
           }
            return const Text('Done');
          } else {
            return const Text('Loading');
          }
        
      
        },
       
    )
    );
  }
}

 