part of 'create_course_bloc.dart';

@immutable
abstract class CreateCourseState {}

class CreateCourseInitial extends CreateCourseState {}
class CreateCoursesblocLoading extends CreateCourseState {}
class CreateCoursesblocLoaded extends CreateCourseState {}
class CreateCoursesblocError extends CreateCourseState{}