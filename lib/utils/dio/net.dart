import 'package:dio/dio.dart';

class NetData{
  /// get请求 不带参数
  Future<dynamic> getHttp(String url)async{
    var res = await Dio().get(url);
    if(res.statusCode == 200){
      return res;
    }
    return {
      "message": '请求失败',
      "statusCode": res.statusCode
    };
  }

  /// get 请求 带参数请求 参数类型 Map<String, dynamic>
  Future<dynamic> getData(String url, Map<String, dynamic> data)async{
    var res = await Dio().get(url,queryParameters: data);
    if(res.statusCode == 200){
      return res;
    }
    return {
      "message": '请求失败',
      "statusCode": res.statusCode
    };
  }

  /// post 请求 不带参数
  Future<dynamic> postHttp(String url)async{
    var res = await Dio().post(url);
    if(res.statusCode == 200){
      return res;
    }
    return {
      "message": '请求失败',
      "statusCode": res.statusCode
    };
  }

  /// post 请求 带参数请求 参数类型 Map<String, dynamic>
  Future<dynamic> postData(String url, Map<String, dynamic> data)async{
    var res = await Dio().post(url,data: data);
    if(res.statusCode == 200){
      return res;
    }
    return {
      "message": '请求失败',
      "statusCode": res.statusCode
    };
  }
}