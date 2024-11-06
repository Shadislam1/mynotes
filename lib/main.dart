import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/register_view.dart';
import 'package:mynotes/views/verify_email_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
     MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
       primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
          '/login/':(context) => const LoginView(title: '',),
           '/register/':(context) => const RegisterView(),
      },
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
    return FutureBuilder(
        future: Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform,
         ),
       builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
          final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
           if (user.emailVerified) {
               print('Email is verified');
               return const Text('Done');
    } else {
      return const VerifyEmailView();
    }
  } else {
    return const LoginView(title: '',);
  }
} else {
  return const CircularProgressIndicator();
}



        
        }  
    );
  }
}

