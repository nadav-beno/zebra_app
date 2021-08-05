import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewer extends StatefulWidget {
  @override
  WebViewerState createState() => WebViewerState();

}

class WebViewerState extends State<WebViewer> {

  //late Completer<WebViewController> _controller = Completer<WebViewController>();
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        //initialUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/800px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg',
        initialUrl: 'about:blank',
        //javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
        _controller = webViewController;
        _loadHtmlFromAssets();
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