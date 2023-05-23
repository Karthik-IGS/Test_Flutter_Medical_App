import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample/features/dashboard/domain/entities/home_screen_models.dart';
import 'package:sample/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<CategoriesModel> categories = [];
  List<AppointmentModel> appoinments = [];
  List<DoctorsModel> doctors = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData();
  }

  updateData() {
    setState(() {
      categories = [
        CategoriesModel(title: 'Hospital', image: 'assets/hospital.png'),
        CategoriesModel(title: 'Consultant', image: 'assets/consultation.png'),
        CategoriesModel(title: 'Recipe', image: 'assets/recipt.png'),
        CategoriesModel(title: 'Appointment', image: 'assets/appointment.png'),
      ];

      appoinments = [
        AppointmentModel(
            name: 'Dr. Ino Yamanaka',
            image: 'assets/doctors.png',
            role: 'Dental Specialist',
            time: '01:17 PM',
            date: '23.05.2023',
            isChatAvailable: true),
        AppointmentModel(
            name: 'Dr. Anusha Roy',
            image: 'assets/consultation.png',
            role: 'Eye Specialist',
            time: '10:35 AM',
            date: '24.05.2023',
            isChatAvailable: true),
      ];

      doctors = [
        DoctorsModel(
            name: 'Dr. Kabuto Yakushi',
            image: 'assets/consultation.png',
            role: 'Heart Specialist',
            rating: '4.7',
            reviewCount: '127'),
        DoctorsModel(
            name: 'Dr. Ino Yamanaka',
            image: 'assets/doctors.png',
            role: 'Dental Specialist',
            rating: '4.8',
            reviewCount: '241'),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
               Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello Luke,",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "How do you feel today?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        context.go(Routes.doctorProfileScreen);
                      },
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/person.png'),
                        radius: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  height: 50,
                  child: CupertinoSearchTextField(
                    controller: searchController,
                    itemSize: 35,
                    backgroundColor: Colors.white,
                    placeholder: 'Search here...',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: categoriesWidget(),
                ),
              ),
              appointmentWidgets(),
              const SizedBox(height: 20),
              doctorsWidgets(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> categoriesWidget() {
    return List.generate(
        categories.length,
        (index) => Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 5.0),
              child: Column(
                children: [
                  Container(
                      height: 60,
                      width: 60,
                      padding: const EdgeInsets.all(18.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(categories[index].image)),
                  const SizedBox(height: 1),
                  Text(
                    categories[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        color: Colors.grey),
                  ),
                ],
              ),
            ));
  }

  Widget appointmentWidgets() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Appointment Today",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              GestureDetector(
                onTap: null,
                child: Text(
                  "See all",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue[400]),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 210,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              appoinments.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xE50971F0),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
                    child: Row(children: [
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(appoinments[index].image),
                                radius: 36,
                              ),
                              const SizedBox(height: 25),
                              Text(
                                appoinments[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                appoinments[index].role,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white30),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (appoinments[index].isChatAvailable)
                                Container(
                                    height: 73,
                                    width: 73,
                                    padding: const EdgeInsets.all(18.0),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xC45FB0F3),
                                    ),
                                    child: const Icon(
                                      Icons.chat,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                              const SizedBox(height: 25),
                              Text(
                                appoinments[index].time,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                appoinments[index].date,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white30),
                              ),
                            ],
                          )),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget doctorsWidgets() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Top Doctor's for you",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              GestureDetector(
                onTap: null,
                child: Text(
                  "See all",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue[400]),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 125,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              doctors.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 90,
                            width: 85,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Image.asset(doctors[index].image),
                          ),
                          const SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                doctors[index].role,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.grey),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                doctors[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  Text(
                                    '${doctors[index].rating}  ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.grey[600]),
                                  ),
                                  const Icon(
                                    Icons.circle_rounded,
                                    color: Colors.black,
                                    size: 6,
                                  ),
                                  Text(
                                    '  ${doctors[index].reviewCount}  Reviews',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.grey[600]),
                                  ),
                                ],
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
