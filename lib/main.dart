import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app2/utils/SplashScreen.dart';
import 'package:flutter_app2/modules/dashboard/dashboard.dart';
import 'package:flutter_app2/modules/login/Login.dart';
import 'package:flutter_app2/providers/bank.dart';
import 'package:flutter_app2/providers/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BankProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Flutter App',
          theme: ThemeData(fontFamily: 'Cairo'),
          home: auth.isAuth
              ? DashboardPage()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResult) =>
                      authResult.connectionState == ConnectionState.waiting ? SplashScreen() : LoginPage(),
                ),
          routes: {
            '/login': (ctx) => LoginPage(),
            '/home': (ctx) => DashboardPage(),
          },
        ),
      ),
    );
  }
}
