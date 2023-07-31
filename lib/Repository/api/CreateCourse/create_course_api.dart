import 'dart:convert';
import 'package:http/http.dart';


import '../../modelclass/CreateCourseModel.dart';
import '../api_client.dart';


class  CreateCourseApi {
  ApiClient apiClient = ApiClient();


  Future<CreateCourseModel> createCourse() async {
    String trendingpath ='/course';
    var body =
      {
        "coursename": "python",
        "courseprice": 2000,
        "author": {
          "fullname": "sreya",
          "website": "fu.com"
        }};
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', body);

    return CreateCourseModel.fromJson(jsonDecode(response.body));
  }
}