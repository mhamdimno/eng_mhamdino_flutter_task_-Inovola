import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
