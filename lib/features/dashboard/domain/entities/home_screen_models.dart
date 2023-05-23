class CategoriesModel {
  String title;
  String image;

  CategoriesModel({
    required this.title,
    required this.image,
  });
}

class AppointmentModel {
  String name;
  String image;
  String role;
  String time;
  String date;
  bool isChatAvailable;

  AppointmentModel({
    required this.name,
    required this.image,
    required this.role,
    required this.time,
    required this.date,
    required this.isChatAvailable,
  });
}

class DoctorsModel {
  String name;
  String image;
  String role;
  String rating;
  String reviewCount;

  DoctorsModel({
    required this.name,
    required this.image,
    required this.role,
    required this.rating,
    required this.reviewCount,
  });
}
