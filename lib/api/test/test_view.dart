import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullish/view/pages/perofrmance/webullish_performance.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test'),),
      body: TextButton(onPressed: () {
        Get.to(()=>  const Webullish_Performance());
      },
      child: const Text('go to'),
      ),
    );
  }
}