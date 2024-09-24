import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LifecycleNotifier extends ChangeNotifier with WidgetsBindingObserver {
  bool _isInBackground = false; //uygulama arkaplan kontrolü için
  String _statusText = 'Aktif'; //uygulama durumu
  final LocalAuthentication _localAuth = LocalAuthentication();

  LifecycleNotifier() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool get isInBackground => _isInBackground;
  String get statusText => _statusText;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      //uygulama arka plana alınmışsa

      setInBackground(true);
    } else if (state == AppLifecycleState.resumed) {
      //tekrar uygulamaya dönüldüyse

      setInBackground(false);
      _requestAuthentication(); //  doğrulama iste
    }
  }

  void setInBackground(bool value) {
    _isInBackground = value;
    _statusText = value ? 'Erişim reddedildi' : 'Aktif';
    notifyListeners();
  }

  Future<void> _requestAuthentication() async {
    try {
      bool authenticated = await _localAuth.authenticate(
        localizedReason: 'Parmak izi ile giriş yapın',
        options: const AuthenticationOptions(biometricOnly: true),
      );
      if (!authenticated) {
        setInBackground(true);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Hata: $e');
      }
    }
  }
}
