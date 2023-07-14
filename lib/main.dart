import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:test_app/ApiLoaderStream.dart';

void main() {
  runApp(
      MaterialApp(
          home: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {

  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test App"),
      ),
      body: InkWell(
        onTap: (){
          color = Color((math.Random().nextDouble() * 0xFFFFFF)
              .toInt()).withOpacity(1.0);
          ApiLoaderStream.apiLoaderBloc.updateLoader(true);
          ApiLoaderStream.apiLoaderBloc.updateLoader(false);
        },
        child: StreamBuilder(
          stream: ApiLoaderStream.apiLoaderBloc.getStream,
          initialData: ApiLoaderStream.apiLoaderBloc.showLoader,
          builder: (context, snapshot) {
            return Container(
              color: color,
              height: double.infinity,
              width: double.infinity,
              child: const Center(
                child: Text("Hello there",style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),),
              ),
            );
          }
        ),
      )
    );
  }
}
