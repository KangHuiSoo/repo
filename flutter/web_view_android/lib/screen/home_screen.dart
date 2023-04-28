import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {
  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(homeUrl);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Code Factory'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.loadRequest(homeUrl);
              },
              icon: Icon(Icons.home),
            ),
          ],
          backgroundColor: Colors.orange,
        ),
        body: WebViewWidget(
          controller: controller,
        ),
        // WebView(
        //   onWebViewCreated: (WebViewController controller) {
        //     this.controller = controller;
        //   },
        //   initialUrl: homeUrl,
        //   javascriptMode: JavascriptMode.unrestricted,
        // ),
        );
  }
}
