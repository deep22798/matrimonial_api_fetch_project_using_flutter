import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rs_matrimonial/utils/routes.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RS Matrimonial',
      getPages: getPages,
      initialRoute: Routes.home,

    );

  }
}
