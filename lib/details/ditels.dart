import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:souq_application_1/Modile/modile.dart';
import 'package:souq_application_1/screens/Bacet.dart';
import 'package:souq_application_1/theme/color.dart';
import 'package:souq_application_1/uitlls/helps/cart_data.dart';
import 'package:souq_application_1/uitlls/helps/costom_Bottom.dart';
import 'package:souq_application_1/uitlls/helps/favorite_data.dart';

class Ditels extends StatefulWidget {
  final Product product;
  const Ditels({super.key, required this.product});

  @override
  State<Ditels> createState() => _DitelsState();
}

class _DitelsState extends State<Ditels> {
  int addRemov = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "تفاصيل المنتج",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                items: [1].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: Colors.red,
                        ),
                        child: Image.network(widget.product.thumbnail),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              Text(
                widget.product.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Text(
                    "${widget.product.price} ج",
                    style: const TextStyle(
                      fontSize: 22,
                      color: UColor.primary,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Cairo",
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    // ignore: sort_child_properties_last
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "خصم 30%",
                        style: TextStyle(fontFamily: "Cairo"),
                      ),
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 236, 190, 121),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Text(
                widget.product.description,
                style: const TextStyle(
                  fontSize: 17,
                  fontFamily: "Cairo",
                  color: UColor.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15),

              Row(
                children: [
                  SizedBox(width: 8),

                  ...List.generate(
                    5,
                    (i) => Icon(
                      i < widget.product.rating.round()
                          ? Icons.star
                          : Icons.star_border,
                      color: Colors.amber,
                    ),
                  ),
                  Text(
                    "(${widget.product.rating}) تقييم",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontFamily: "Cairo",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الكميه",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Cairo",
                      color: Colors.black,
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 237, 237),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                addRemov++;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                          SizedBox(width: 10),

                          Text(
                            "${addRemov}",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (addRemov > 0) {
                                  addRemov--;
                                }
                              });
                            },
                            child: Icon(Icons.remove),
                          ),
                        ],
                      ),
                    ),
                  ),
                
                ],
              ),
                  SizedBox(height: 15,),
                                    
             
              GestureDetector(
                
                onTap: () {
                cartProducts.add(widget.product);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("تمت إضافة المنتج للسلة"),
              )
              );
              },
                child: CostomBottom(
                  text: "أضف للسله",
                  color: UColor.primary,
                  colorText: Colors.white,
                  icon: Icons.shopping_cart_outlined,
                  colorIcon: Colors.white,
                ),
              ),
                SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
favoriteProducts.add(widget.product);                },
                child: CostomBottom(
                  text: "أضف للمفضله",
                  color:Colors.white ,
                  colorText: UColor.primary,
                  icon: Icons.favorite_border,
                  colorIcon: UColor.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
