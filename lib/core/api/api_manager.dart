import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class ApiManager{
  static late Dio dio;
  static void init(){
    dio = Dio(BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      receiveDataWhenStatusError: true,
      validateStatus: (status){
        return status!<500;
      }
    ));
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }
  
  static Future<Response>? GetPosts(){
    return dio.get("todos");
  }
}