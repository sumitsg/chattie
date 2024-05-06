import 'package:chattie/common/route/route_generator.dart';
import 'package:chattie/common/utils/preferances/app_preferances.dart';
import 'package:chattie/common/utils/theme/custom_theme.dart';
import 'package:chattie/features/login/provider/auth_provider.dart'
    as loginAuth;
import 'package:chattie/features/splash_screen/splash_screen.dart';
import 'package:chattie/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  AppPreferances preferences = await AppPreferances.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<loginAuth.AuthProvider>(
          create: (context) => loginAuth.AuthProvider(
            googleSignIn: GoogleSignIn(),
            firebaseAuth: FirebaseAuth.instance,
            firebaseFirestore: firebaseFirestore,
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: CustomTheme.lightTheme,
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        // home: const SplashScreen(),
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
