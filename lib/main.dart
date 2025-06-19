import 'package:flutter/material.dart';
import 'package:biometricauth/homescreen.dart';
import 'package:biometricauth/utils/biometric_auth.dart';

void main() => runApp(const SafenestApp());

class SafenestApp extends StatelessWidget {
  const SafenestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BiometricGate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BiometricGate extends StatefulWidget {
  const BiometricGate({super.key});

  @override
  State<BiometricGate> createState() => _BiometricGateState();
}

class _BiometricGateState extends State<BiometricGate> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    BiometricAuth.runWithAuth(
      reason: 'Unlock the app',
      onSuccess: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      },
      onFailure: () {
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.of(context).pop(); // or SystemNavigator.pop();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('please authenticate'),
          Center(
            child: _loading
                ? const CircularProgressIndicator()
                : const Text('Authentication failed. Closing app.'),
          ),
        ],
      ),
    );
  }
}
