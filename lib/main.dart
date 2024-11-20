import 'package:flutter/material.dart';
import 'package:goodbye_stale_mobile/screens/home.dart';
import 'package:goodbye_stale_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest cookieRequest = CookieRequest();
        return cookieRequest;
      },
      child: MaterialApp(
        title: 'Goodbye::Stale',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
              .copyWith(
                secondary: Theme.of(context).colorScheme.primary,
              )
              .copyWith(
                tertiary: Theme.of(context).colorScheme.secondary,
              ),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
