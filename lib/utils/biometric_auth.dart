import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuth {
  static final LocalAuthentication _auth = LocalAuthentication();

  /// Basic reusable auth method
  static Future<bool> authenticate({
    String reason = 'Please authenticate',
  }) async {
    try {
      final canAuth =
          await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
      if (!canAuth) return false;

      return await _auth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: false,
        ),
      );
    } catch (e) {
      print('Authentication error: $e');
      return false;
    }
  }

  /// Modular utility: call with success/failure logic
  static Future<void> runWithAuth({
    required VoidCallback onSuccess,
    VoidCallback? onFailure,
    String reason = 'Please authenticate',
  }) async {
    final success = await authenticate(reason: reason);
    if (success) {
      onSuccess();
    } else {
      if (onFailure != null) {
        onFailure();
      }
    }
  }
}
