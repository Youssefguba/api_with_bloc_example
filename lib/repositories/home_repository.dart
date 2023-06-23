import 'package:dio/dio.dart';

class HomeRepository {

  dynamic getHomeData() async {
    final response = await Dio().get('https://student.valuxapps.com/api/home');
    return response.data;
  }
}