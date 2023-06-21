// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:webullish/api/class/crud.dart';

class InitailBaindings extends Bindings
{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}