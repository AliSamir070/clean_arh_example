import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

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
  }
  
  static Future<Response>? GetPosts(){
    return dio.get("todos");
  }
}