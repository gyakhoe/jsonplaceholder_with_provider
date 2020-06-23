import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_provider/provider/post_screen_provider.dart';
import 'package:jsonplaceholder_with_provider/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(providers: [
        Provider(
          create: (context) => PostScreenProvider(),
        ),
        FutureProvider(
          create: (context) => PostScreenProvider().fetchPostScreenDetails(),
        ),
      ], child: HomeScreen()),
    );
  }
}
