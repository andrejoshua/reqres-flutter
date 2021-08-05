import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres/di.dart';
import 'package:reqres/view/login/page.dart';
import 'package:reqres/view/resource_detail/page.dart';
import 'package:reqres/view/resources/page.dart';
import 'package:stack_trace/stack_trace.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeInjection();

  Chain.capture(() async {
    runApp(GetMaterialApp(
      title: 'Reqres',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      getPages: [
        GetPage(name: 'login', page: () => LoginPage()),
        GetPage(name: 'resources', page: () => ResourcesPage()),
        GetPage(name: 'resourceDetail', page: () => ResourceDetailPage()),
      ],
    ));
  });
}
