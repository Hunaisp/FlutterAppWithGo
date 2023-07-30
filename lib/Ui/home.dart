import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goserver_local_host/Bloc/GetAllCourses/get_all_courses_bloc.dart';
import 'package:goserver_local_host/Repository/modelclass/GetAllCourses.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
late List< GetAllCourses >courses;
class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<GetAllCoursesBloc>(context).add(FetchCourses());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<GetAllCoursesBloc, GetAllCoursesState>(
      builder: (context, state) {
        if (state is GetAllCoursesblocLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetAllCoursesblocError) {
          return Center(
            child: Text("Error"),
          );
        }
        if (state is GetAllCoursesblocLoaded) {
          courses=BlocProvider.of<GetAllCoursesBloc>(context).getAllCourses;
          return GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            children: List.generate(courses.length, (index) {
              return Padding(
                padding: EdgeInsets.all(8.0), // Adjust the values as per your desired spacing
                child: Card(elevation: 4,  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
                  child: Container(
                    color: Colors.orange,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CourseName: ${courses[index].coursename.toString()}"),
                        SizedBox(height: 20),
                        Text("Price: ${courses[index].courseprice.toString()}"),
                        SizedBox(height: 20),
                        Text("Teacher: ${courses[index].author?.fullname.toString()}"),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );

        } else {
          return SizedBox();
        }
      },
    ));
  }
}
