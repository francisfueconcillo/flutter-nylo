import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
// import 'package:package_info_plus/package_info_plus.dart';

class VersionInfo extends StatelessWidget {
  final Color color;
  const VersionInfo({super.key, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text('Version ' + getEnv('APP_VERSION'))
        .bodySmall(context)
        .setStyle(TextStyle(color: color));

    /* FIXME -- error encountered during compile
      Execution failed for task ':package_info_plus:compileDebugJavaWithJavac'.
      > error: invalid source release: 17
    */

    // return NyFutureBuilder(
    //     future: PackageInfo.fromPlatform(),
    //     child: (context, data) {
    //       String version = data!.version;
    //       String buildNumber = data!.buildNumber;
    //       return Text(version).titleSmall(context);
    //     });
  }
}
