import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'auth_web.dart';
import 'crypto_app.dart';
import 'crypto_web.dart';
import 'dashboard_web.dart';
import 'stats_web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ui Demo App',
      debugShowCheckedModeBanner: false,
      home: kIsWeb ? WebDemos() : CryptoApp(),
    );
  }
}

class WebDemos extends StatelessWidget {
  const WebDemos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Select",
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 10),
            const Text(
              "Zoom out for best experience",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const StatsWeb()),
                );
              },
              child: const Text(
                "Pancake Statistics",
                style: TextStyle(fontSize: 36),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const DashBoardWeb()),
                );
              },
              child: const Text(
                "Dashboard",
                style: TextStyle(fontSize: 36),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AuthWeb()),
                );
              },
              child: const Text(
                "Authentication",
                style: TextStyle(fontSize: 36),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CryptoWeb()),
                );
              },
              child: const Text(
                "Crypto Dashboard",
                style: TextStyle(fontSize: 36),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CryptoApp()),
                );
              },
              child: const Text(
                "Crypto App",
                style: TextStyle(fontSize: 36),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
