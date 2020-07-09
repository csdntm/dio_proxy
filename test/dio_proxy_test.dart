import 'package:test/test.dart';
import 'package:dio/dio.dart';

import 'package:dio_proxy/dio_proxy.dart';

void main() {
  test('dio proxy', () async {
    Dio dio = Dio()
      ..options.baseUrl = "https://httpbin.org/"
      ..httpClientAdapter = HttpProxyAdapter();

    Response<String> response = await dio.get('/get?a=2');
    print(response.data);
    // expect(response.data, contains('args'));
    response = await dio.post('/post', data: {"a": 2});
    print(response.data);
    // expect(response.data, contains('args'));
  });
}
