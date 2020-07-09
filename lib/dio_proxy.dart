library dio_proxy;

import 'dart:io';
import 'package:dio/adapter.dart';

/// Dio HttpProxy Adapter 给通过网关的请求加上签名
/// [ipAddr] ip地址，默认是localhost
/// [port] 端口，默认是8888
///
class HttpProxyAdapter extends DefaultHttpClientAdapter {
  final String ipAddr;
  final int port;

  HttpProxyAdapter({this.ipAddr = 'localhost', this.port = 8888}) {
    this.onHttpClientCreate = (client) {
      String proxy = '${this.ipAddr}:${this.port}';
      client.findProxy = (url) {
        return 'PROXY $proxy';
      };

      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }
}
