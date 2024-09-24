import 'package:flutter/material.dart';
import 'package:local_auth_lifecycle/providers/local_auth_notifier.dart';
import 'package:local_auth_lifecycle/views/b_view.dart';
import 'package:provider/provider.dart';

class AView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final authNotifier =
                Provider.of<AuthNotifier>(context, listen: false);
            bool authenticated =
                await authNotifier.authenticate(); //biyometrik dogrulama iste
            if (authenticated) {
              //başarılıysa ekrana geç
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BView()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Erişim reddedildi!')),
              );
            }
          },
          child: const Text('İkinci Ekrana Git'),
        ),
      ),
    );
  }
}
