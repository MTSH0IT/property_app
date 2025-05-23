import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:property_app/features/app_info/presentation/view/widgets/app_info_body.dart';

class AppInfoView extends StatelessWidget {
  const AppInfoView({super.key});
  static const String routeName = 'app_info_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_info.title'.tr()),
        centerTitle: true,
        elevation: 0,
      ),
      body: AppInfoBody(),
    );
  }
}
