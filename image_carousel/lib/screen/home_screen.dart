import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState(){
    super.initState();

    // timer는 멈추라고 할 때 까지 백그라운드에서 계속 실
    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      if(nextPage > 4){
        nextPage = 0;
      }

      controller.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.linear,);
    });
  }

  @override
  void dispose() { // state가 죽을 때 호출
    controller.dispose();
    if(timer != null){
      timer!.cancel(); // timer가 null 아닌 것을 인지 하지 못해 !를 붙여줌
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // 앱과 관련이 없는 상태바(시간, 와이파이 배터리 등)의 색깔을 바꿀 수 있음
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1, 2, 3, 4, 5].map(
              (e) => Image.asset(
              'asset/img/image_$e.jpeg',
              fit: BoxFit.cover),
        ).toList(),
      ),
    );
  }
}