import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  bool isLoading = true;
  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 204, 0, 1),
        title: Text(
          "Privacy Policy",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: "https://ghuriexpress.com/privacy",
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Column(
                  children: [
                    LinearProgressIndicator(
                      color: Color.fromRGBO(204, 0, 0, 1),
                    ),
                  ],
                )
              : Stack()
        ],
      ),
    );
  }
}
