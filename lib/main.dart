import 'package:flutter/material.dart';
import 'package:local_auth_lifecycle/providers/lifecycyle_notifier.dart';
import 'package:local_auth_lifecycle/providers/local_auth_notifier.dart';
import 'package:local_auth_lifecycle/views/a_view.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthNotifier()),
        ChangeNotifierProvider(create: (_) => LifecycleNotifier()),
      ],
      child: MaterialApp(
        title: 'Local Auth with Lifecycles',
        home: AView(),
      ),
    );
  }
}
