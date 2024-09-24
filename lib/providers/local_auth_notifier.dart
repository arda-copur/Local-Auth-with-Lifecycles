import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class AuthNotifier extends ChangeNotifier {
  final LocalAuthentication auth = LocalAuthentication();
  Future<bool> authenticate() async {
    try {
      // Cihazda biyometrik doğrulama desteği var mı?
      bool canCheckBiometrics = await auth.canCheckBiometrics;
      if (!canCheckBiometrics) {
        // Cihazda biyometrik doğrulama desteklenmiyorsa false

        return false;
      }

      // Cihazdaki biyometrik doğrulama yöntemlerini al
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      if (availableBiometrics.isEmpty) {
        // Eğer cihaz biyometrik doğrulama yöntemine sahip değilse false

        return false;
      }

      // Yüz tanıma ya da parmak izi desteği varsa doğrulama yap
      return await auth.authenticate(
        localizedReason: 'Biyometrik doğrulama yapın',
        options: const AuthenticationOptions(biometricOnly: true),
      );
    } catch (e) {
      return false;
    }
  }
}
