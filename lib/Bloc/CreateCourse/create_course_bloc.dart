

import 'package:bloc/bloc.dart';
import 'package:goserver_local_host/Repository/api/CreateCourse/create_course_api.dart';
import 'package:goserver_local_host/Repository/modelclass/CreateCourseModel.dart';
import 'package:meta/meta.dart';

part 'create_course_event.dart';
part 'create_course_state.dart';

class CreateCourseBloc extends Bloc<CreateCourseEvent, CreateCourseState> {
  late CreateCourseModel courseModel;
  CreateCourseApi createCourseApi=CreateCourseApi();
  CreateCourseBloc() : super(CreateCourseInitial()) {
    on<FetchCreateCourse>((event, emit)async {
      emit(CreateCoursesblocLoading());
      try{

        courseModel = await createCourseApi.createCourse();
        emit(CreateCoursesblocLoaded());
      } catch(e){
        print(e);
        emit(CreateCoursesblocError());}
    });
  }
}
