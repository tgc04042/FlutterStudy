import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;
  final homeUrl = 'https://plum-chipmunk-967.notion.site/Kim-JaeHoon-92c78f2ca48a44ad91e74018c0b414b7';

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Jaehoon'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                if(controller == null){
                  return;
                }
                // android에서는 controller가 null이 될 수 없다는 것을 명식적으로 알려줘야함 => !
                controller!.loadUrl(homeUrl);
              },
              icon: Icon(
                Icons.home,
              ),
            ),
          ],
        ),
        body: WebView(
          // 보통 on 으로 시작하면 어떤 행동이 시작됬을 때 라는 의미
          onWebViewCreated: (WebViewController controller) {
            this.controller = controller;
          }, // web view controller 생성
          // initialUrl: 'https://blog.codefactory.ai',
          initialUrl: homeUrl,
          javascriptMode:
              JavascriptMode.unrestricted, // javascript 사용 허용, defalut: disable
        ));
  }
}