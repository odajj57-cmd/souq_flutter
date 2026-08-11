import 'package:flutter/material.dart';
import 'package:souq_application_1/theme/color.dart';

class CostomBottom extends StatelessWidget {
  const CostomBottom({super.key, required this.text, required this.color, required this.colorText, required this.icon, required this.colorIcon});
final String text;
final Color color;
final Color colorText;
final IconData icon;
final Color colorIcon;
  @override
  Widget build(BuildContext context) {
    return  Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: UColor.primary),
                  color: color,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon,color: colorIcon,),
                      SizedBox(width: 10),
                      Text(
                        text,
                        style: TextStyle(fontSize: 20, fontFamily: "Cairo",color: colorText),
                      ),
                    ],
                  ),
                ),
              );
  }
}