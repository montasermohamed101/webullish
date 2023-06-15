

import 'package:webullish/api/class/crud.dart';
import 'package:webullish/api/link/link_api.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  Map<String, String>? headers = {
          'Content-Type': 'application/json',
          };

  getPerformanceData() async {
    var response = await crud.getRequest('${AppLink.serverUrl}/${AppLink.performanceUrl}', headers);
    return response.fold((l) => l, (r) => r);
  }
}