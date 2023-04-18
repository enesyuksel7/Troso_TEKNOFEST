import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:troso/dronemap/screens/dronemap.dart';
import 'package:troso/firebase_options.dart';
import 'package:troso/screens/login.dart';
import 'package:troso/screens/allmuseums.dart';
import 'screens/checkout.dart';
import 'screens/home.dart';
import 'screens/profile.dart';
import 'utils/application_state.dart';
import 'utils/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final String response = await rootBundle.loadString("assets/config/stripe.json");
  final data = await json.decode(response);
  Stripe.publishableKey = data["publishableKey"];

  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => Consumer<ApplicationState>(
        builder: (context, applicationState, _) {
          Widget child;
          switch (applicationState.loginState) {
            case ApplicationLoginState.loggetOut:
              child = LoginScreen();
              break;
            case ApplicationLoginState.loggedIn:
              child = MyApp();
              break;
            default:
              child = LoginScreen();
          }

          return MaterialApp(
            theme: CustomTheme.getTheme(),
            home: child,
          );
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("TROSO"),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
            boxShadow: CustomTheme.cardShadow,
          ),
          child: const TabBar(
            padding: EdgeInsets.symmetric(vertical: 10),
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.location_on)),
              Tab(icon: Icon(Icons.shopping_cart)),
              Tab(icon: Icon(Icons.preview)),
              Tab(icon: Icon(Icons.museum)),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(), // Bu satırı ekleyin
          children: [
            HomeScreen(),
            DroneMapScreen(),
            CheckOutScreen(),
            ProfileScreen(),
            AllMuseumsPage(),
          ],
        )
      ),
    );
  }
}
