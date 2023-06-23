

import 'package:webullish/api/class/crud.dart';
import 'package:webullish/api/link/link_api.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  Map<String, String>? headers = {
          'Content-Type': 'application/json',
          };

  getPerformanceData() async {
    var response = await crud.getRequest('${ApiConst.baseUrl}/${ApiConst.performanceUrl}', headers);
    return response.fold((l) => l, (r) => r);
  }

  
}