import 'package:flutter/material.dart';

Widget _loadingIcon() {
  return Container(
    width: 200,
    height: 200,
    color: Colors.white,
    alignment: Alignment.center,
    child: const SizedBox.square(
      dimension: 40,
      child: CircularProgressIndicator(),
    ),
  );
}

/// 加载框
void showLoading(BuildContext context) {
  showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: _loadingIcon(),
          ),
        );
      });
}
