import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';


class Recaptcha extends StatefulWidget{

  const Recaptcha({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecaptchaState();
  }
}

class RecaptchaState extends State<Recaptcha>{
  bool submit = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebViewPlus(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller){
          debugPrint("i pass to colling webpage");
      controller.loadUrl("assets/webPage/index.html");
      debugPrint("I go to html file and back ");
    },
    javascriptChannels: Set.from([
    JavascriptChannel(name: 'Captcha', onMessageReceived: (JavascriptMessage message){
    onChange : (submit)=> setState(()=>this.submit =true);
    })
    ])
    );

  }
}