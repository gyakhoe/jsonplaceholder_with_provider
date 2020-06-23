import 'package:flutter/material.dart';
import 'package:jsonplaceholder_with_provider/provider/album_screen_provider.dart';
import 'package:jsonplaceholder_with_provider/provider/post_screen_provider.dart';
import 'package:jsonplaceholder_with_provider/provider/user_screen_provider.dart';
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
        FutureProvider(
          create: (context) => PostScreenProvider().fetchPostScreenDetails(),
        ),
        FutureProvider(
          create: (context) => AlbumScreenProvider().fetchAllAlbumDetails(),
        ),
        FutureProvider(
          create: (context) => UserScreenProvider().fetchAllUserDetails(),
        ),
      ], child: HomeScreen()),
    );
  }
}
