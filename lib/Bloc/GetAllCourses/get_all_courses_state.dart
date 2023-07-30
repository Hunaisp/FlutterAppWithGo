part of 'get_all_courses_bloc.dart';

@immutable
abstract class GetAllCoursesState {}

class GetAllCoursesInitial extends GetAllCoursesState {}
class GetAllCoursesblocLoading extends GetAllCoursesState {}
class GetAllCoursesblocLoaded extends GetAllCoursesState {}
class GetAllCoursesblocError extends GetAllCoursesState{}