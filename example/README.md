```Dart
import 'package:dio/dio.dart';
import 'package:dio_proxy/dio_proxy.dart';

void main() async{

    Dio dio = Dio()
      ..options.baseUrl = "https://httpbin.org/"
      ..httpClientAdapter = HttpProxyAdapter();

    Response<String> response = await dio.get('/get?a=2');
    print(response.data);

    response = await dio.post('/post', data: {"a": 2});
    print(response.data);


}

```
