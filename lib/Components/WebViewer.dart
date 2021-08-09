import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewer extends StatefulWidget {
  const WebViewer({Key? key}) : super(key: key);

  @override
  _WebViewerState createState() => _WebViewerState();
}

class _WebViewerState extends State<WebViewer> {

  late WebViewController _controller;

  @override
  void initState() {

    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'about:blank',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _loadHtmlFromAssets();
          _controller.evaluateJavascript('function f1(){alert("hello zebra")}');
          _controller.evaluateJavascript('f1();');
        },

      ),

    );
  }
  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('assets/index.html');
    _controller.loadUrl( Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }
}