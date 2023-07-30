import 'dart:convert';


import 'package:goserver_local_host/Repository/modelclass/GetAllCourses.dart';
import 'package:http/http.dart';


import '../api_client.dart';


class GetAllCoursesApi {
  ApiClient apiClient = ApiClient();


  Future<List<GetAllCourses>> getCourses() async {
    String trendingpath ='http://192.168.43.67:8080/course';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return GetAllCourses.listFromJson(jsonDecode(response.body));
  }
}