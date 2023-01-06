import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget{
  final Color color;

  const HomeScreen({
    required this.color,
    Key? key,
}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      color: widget.color, // widget.color : HomeScreen 위젯에 있는 color 값을 가져옴
    );
  }
}

class _HomeScreen extends StatelessWidget {
  final Color color;

  const _HomeScreen({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      color: color,
    );
  }
}