import 'package:ecommerce_app/View/splash_screen/splash.dart';
import 'package:ecommerce_app/viewModel/AuthScreenProvider.dart';
import 'package:ecommerce_app/viewModel/featureIconProvider.dart';
import 'package:ecommerce_app/viewModel/homeScreenProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Get the application documents directory
  final appDocumentsDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDirectory.path);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ScreenProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => AuthenticationProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.pink),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
