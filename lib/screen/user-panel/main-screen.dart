import 'package:ecommerceapp/utils/app-constant.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: AppConstant.appMianColor,
        title: Text(AppConstant.appMainName),
      ),
      body: Container(),
    );
  }
}