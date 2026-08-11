import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:souq_application_1/screens/favorite.dart';
import 'package:souq_application_1/screens/splah.dart';
import 'package:souq_application_1/theme/color.dart';
import 'package:souq_application_1/uitlls/helps/costom_Bottom.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "حسابي",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 44, 24, 32),

        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: UColor.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Icon(
                    Icons.person_rounded,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "الاسم",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 65,
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(TablerIcons.package, color: UColor.primary),
                      SizedBox(width: 10),

                      Text(
                        "طلباتي",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_right, color: Colors.grey),
                    ],
                  ),
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.fromBorderSide(BorderSide()),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Favorite()),
                  );
                },
                child: Container(
                  height: 65,
                  // ignore: sort_child_properties_last
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(TablerIcons.heart, color: UColor.primary),
                        SizedBox(width: 10),

                        Text(
                          "المفضله",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_right, color: Colors.grey),
                      ],
                    ),
                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.fromBorderSide(BorderSide()),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 65,
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: UColor.primary),
                      SizedBox(width: 10),

                      Text(
                        "عناوين التوصيل",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_right, color: Colors.grey),
                    ],
                  ),
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.fromBorderSide(BorderSide()),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 65,
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(TablerIcons.settings, color: UColor.primary),
                      SizedBox(width: 10),

                      Text(
                        "الاعدادات",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_right, color: Colors.grey),
                    ],
                  ),
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.fromBorderSide(BorderSide()),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SplashScreen()));
                },
                child: CostomBottom(text: "تسجيل الخروج", color: Colors.red.shade100, colorText: Colors.red, icon: Icons.exit_to_app, colorIcon: Colors.red))
            ],
          ),
        ),
      ),
    );
  }
}
