import 'package:flutter/material.dart';
import 'package:biometricauth/utils/biometric_auth.dart';

class DownloadInfoScreen extends StatelessWidget {
  const DownloadInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Download Info')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            BiometricAuth.runWithAuth(
              reason: 'Authenticate to download your data',
              onSuccess: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Data downloaded successfully!'),
                  ),
                );
                print('User data downloaded...');
              },
              onFailure: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Authentication failed.')),
                );
              },
            );
          },
          child: const Text('Download Info'),
        ),
      ),
    );
  }
}
