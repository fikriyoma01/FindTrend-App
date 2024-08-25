import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/login_screen.dart';
import 'pages/plant_recommendations_screen.dart';
import 'pages/community_forum_screen.dart';
import 'post_notifier.dart';
import 'splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostNotifier()..loadPosts(),
      child: const FindTrendApp(),
    ),
  );
}

class FindTrendApp extends StatelessWidget {
  const FindTrendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FindTrend!',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/recommendations': (context) => PlantRecommendationsScreen(),
        '/community_forum': (context) => CommunityForumScreen(),
      },
      onGenerateRoute: (settings) {
        return null;
      },
      onUnknownRoute: (settings) {
        return null;
      },
    );
  }
}
