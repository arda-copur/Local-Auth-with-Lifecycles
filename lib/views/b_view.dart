import 'package:flutter/material.dart';
import 'package:local_auth_lifecycle/providers/lifecycyle_notifier.dart';
import 'package:provider/provider.dart';

class BView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LifecycleNotifier>(
      builder: (context, lifecycleNotifier, child) {
        return Scaffold(
          body: Container(
            color:
                lifecycleNotifier.isInBackground ? Colors.black : Colors.white,
            child: Center(
              child: Text(
                lifecycleNotifier.statusText,
                style: TextStyle(
                  fontSize: 24,
                  color: lifecycleNotifier.isInBackground
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
