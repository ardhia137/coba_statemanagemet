import 'package:coba_getx/view/ref_jns_notif_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  print( String.fromEnvironment('API_BASE_URL'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RefJnsNotif CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RefJnsNotifView(),  
    );
  }
}