
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/notes_view.dart';
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
          loginRoute:(context) => const LoginView(title: '',),
           registerRoute:(context) => const RegisterView(),
           notesRoute:(context) => const NotesView(),
           VerifyEmailRoute:(context) => VerifyEmailView(),
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
        future: AuthService.firebase().initialize(),
       builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
          final user = AuthService.firebase().currentUser;
            if (user != null) {
           if (user.isEmailVerified) {
              return const NotesView();
              // return const Text('Done');
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

  

