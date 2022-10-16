import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

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
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        minWidth: 400,
        defaultScale: !kIsWeb,
        background: Container(color: const Color(0xFFF5F5F5)),
      ),
      title: 'Ui Demo App',
      debugShowCheckedModeBanner: false,
      home: kIsWeb ? const WebDemos() : const CryptoApp(),
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
          children: [
            const Spacer(),
            const Text(
              "Select a web",
              style: TextStyle(fontSize: 28),
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
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CryptoApp()),
                );
              },
              child: const Text(
                "App",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
