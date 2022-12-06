import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_aws_rekognition/flutter_aws_rekognition.dart';

import 'pages/compare_faces_page.dart';
import 'pages/compare_faces_page2.dart';
import 'pages/detect_faces_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    AWSRekognition.init(
      const AWSConfig(
        awsAccessKeyId: String.fromEnvironment('ACCESS_KEY_ID'),
        awsSecretAccessKey: String.fromEnvironment('SECRET_ACCESS_KEY'),
        bucket: 'gps-test',
        region: 'us-east-2',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Map<String, Widget> _children = <String, Widget>{
      'Detect Faces': DetectFacesPage(),
      'Compare Faces': CompareFacesPage(),
      'Compare Faces 2': CompareFacesPage2(),
    };

    return DefaultTabController(
      length: _children.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            kToolbarHeight + MediaQueryData.fromWindow(window).padding.top,
          ),
          child: Container(
            alignment: Alignment.bottomLeft,
            height: kToolbarHeight + MediaQueryData.fromWindow(window).padding.top,
            child: TabBar(
              isScrollable: true,
              tabs: _children.keys.map((String key) => Tab(text: key)).toList(),
            ),
          ),
        ),
        body: TabBarView(children: _children.values.toList()),
      ),
    );
  }
}
