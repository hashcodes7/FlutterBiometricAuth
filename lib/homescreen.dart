import 'package:flutter/material.dart';
import 'package:biometricauth/download_infopage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.download),
          label: const Text('Download My Info'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DownloadInfoScreen()),
            );
          },
        ),
      ),
    );
  }
}
