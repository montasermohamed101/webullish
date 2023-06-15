// ignore_for_file: unused_import, implementation_imports

import 'package:flutter/material.dart';
import 'package:webullish/api/class/status_request.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: CircularProgressIndicator())
        : statusRequest == StatusRequest.offLineFailure
            ? const AlertDialog(
                title: Text(
                  'Error',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                content: Text(
                  'OffLine Failure',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? const Center(
                    child: Text(
                    'Server Failure',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ))
                : statusRequest == StatusRequest.failure
                    ? const Center(
                        child: Text(
                        'Not data',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ))
                    : widget;
  }
}
