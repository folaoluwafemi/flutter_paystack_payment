import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' as view;

String? response = "nulll";

Future<String?> value() async {
  // if (response!.isEmpty) {
  //   return "";
  // }
  // response
  if (response!.isNotEmpty) {
    return response;
  }
  return "nulll";
}

// /*  */
class WebView extends StatefulWidget {
  final String url;

  // const WebView(Key? key) : super(key: key);

  const WebView({required this.url, Key? key}) : super(key: key);

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  view.WebViewController? controller;

  void readResponse() async {
    // setState(() {
    controller!
        .runJavascriptReturningResult(
            "document.getElementById('return').innerText")
        .then((value) async {
      // if (value == "null ") {
      //   response =
      //       "{\"status\":\"requery\",\"message\":\"Reaffirm Transaction Status on Server\"}";
      // } else {
      response = response!.length > 7 ? response : value;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
// value contains the html data of page as string

    // );
    // WebView(    )
    return view.WebView(
      initialUrl: widget.url,
      onWebViewCreated: (controller) {
        controller = controller;
        readResponse();
      },
      javascriptMode: view.JavascriptMode.unrestricted,
      gestureNavigationEnabled: true,
      onPageFinished: (_) {
        readResponse();
      },
    );
  }
}
