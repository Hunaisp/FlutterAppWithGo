class CreateCourseModel {
  CreateCourseModel({
      this.courseid, 
      this.coursename, 
      this.courseprice, 
      this.author,});

  CreateCourseModel.fromJson(dynamic json) {
    courseid = json['courseid'];
    coursename = json['coursename'];
    courseprice = json['courseprice'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
  }
  String? courseid;
  String? coursename;
  int? courseprice;
  Author? author;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['courseid'] = courseid;
    map['coursename'] = coursename;
    map['courseprice'] = courseprice;
    if (author != null) {
      map['author'] = author?.toJson();
    }
    return map;
  }

}

class Author {
  Author({
      this.fullname, 
      this.website,});

  Author.fromJson(dynamic json) {
    fullname = json['fullname'];
    website = json['website'];
  }
  String? fullname;
  String? website;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullname'] = fullname;
    map['website'] = website;
    return map;
  }

}