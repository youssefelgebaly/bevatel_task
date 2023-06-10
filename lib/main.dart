import 'package:bevatel_task/view/screens/home_screen/home_screen.dart';
import 'package:bevatel_task/view_model/api/dio_helper.dart';
import 'package:bevatel_task/view_model/observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
  await DioHelper.initialize();
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      ),
      home: HomeScreen(),
    );
  }
}
