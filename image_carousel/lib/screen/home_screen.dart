import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;행

  @override
  void initState(){
    super.initState();

    // timer는 멈추라고 할 때 까지 백그라운드에서 계속 실
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print('Timer!');
    });
  }

  @override
  void dispose() { // state가 죽을 때 호출
    if(timer != null){
      timer!.cancel(); // timer가 null 아닌 것을 인지 하지 못해 !를 붙여줌
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [1, 2, 3, 4, 5].map(
                (e) => Image.asset(
                    'asset/img/image_$e.jpeg',
                fit: BoxFit.cover),
        ).toList(),
      ),
    );
  }
}
