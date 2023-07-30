

import 'package:bloc/bloc.dart';
import 'package:goserver_local_host/Repository/api/GetAllCourse/getAllCourseApi.dart';
import 'package:goserver_local_host/Repository/modelclass/GetAllCourses.dart';
import 'package:meta/meta.dart';

part 'get_all_courses_event.dart';
part 'get_all_courses_state.dart';

class GetAllCoursesBloc extends Bloc<GetAllCoursesEvent, GetAllCoursesState> {
  late List<GetAllCourses> getAllCourses;
  GetAllCoursesApi getAllCoursesApi=GetAllCoursesApi();
  GetAllCoursesBloc() : super(GetAllCoursesInitial()) {
    on<FetchCourses>((event, emit) async{
      emit(GetAllCoursesblocLoading());
      try{

        getAllCourses = await getAllCoursesApi.getCourses();
        emit(GetAllCoursesblocLoaded());
      } catch(e){
        print(e);
        emit(GetAllCoursesblocError());}
    });
  }
}
