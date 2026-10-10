import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Your Firebase Hosting address. "?app=1" lets proctored tasks run on phones.
const kPortalUrl = 'https://YOUR-PROJECT.web.app/?app=1';

void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Portal()));

class Portal extends StatefulWidget {
  const Portal({super.key});
  @override
  State<Portal> createState() => _PortalState();
}

class _PortalState extends State<Portal> {
  late final WebViewController c;

  @override
  void initState() {
    super.initState();
    c = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setOnPlatformPermissionRequest((r) => r.grant()) // lets the page use camera + mic
      ..loadRequest(Uri.parse(kPortalUrl));
    [Permission.camera, Permission.microphone].request(); // ask the phone's OS first
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: SafeArea(child: WebViewWidget(controller: c)));
}
