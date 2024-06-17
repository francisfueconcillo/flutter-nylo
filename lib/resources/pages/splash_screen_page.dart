import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '/bootstrap/helpers.dart';
import '/resources/widgets/safearea_widget.dart';
import '/resources/widgets/logo_widget.dart';
import '/resources/widgets/loader_widget.dart';
import '/resources/widgets/version_info_widget.dart';
import '/resources/pages/login/login_page.dart';

class SplashScreenPage extends NyStatefulWidget {
  static const path = '/splash-screen';

  SplashScreenPage({super.key}) : super(path, child: _SplashScreenPageState());
}

class _SplashScreenPageState extends NyState<SplashScreenPage> {
  @override
  init() async {}

  // Use boot if you need to load data before the [view] is rendered.
  @override
  boot() async {
    Timer(
        Duration(seconds: 3),
        () => routeTo(
              LoginPage.path,
              pageTransition: PageTransitionType.rightToLeft,
              navigationType: NavigationType.pushReplace,
            ));
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.get(context).background,
      body: SafeAreaWidget(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Logo(),
              SizedBox(height: 10.0),
              Text(getEnv('APP_NAME')).titleLarge(context).setStyle(
                    TextStyle(
                      color: ThemeColor.get(context).primaryAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              SizedBox(height: 10.0),
              VersionInfo(
                color: ThemeColor.get(context).primaryAccent,
              ),
              SizedBox(height: 80.0),
              Loader(),
            ],
          ),
        ),
      ),
    );
  }
}
