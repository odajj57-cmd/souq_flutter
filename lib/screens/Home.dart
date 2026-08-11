import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq_application_1/Modile/api_service.dart' as ApiService;
import 'package:souq_application_1/Modile/modile.dart';
import 'package:souq_application_1/details/ditels.dart';
import 'package:souq_application_1/theme/color.dart';
import 'package:souq_application_1/uitlls/helps/favorite_data.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  int isselectedIndex = 0;

  List<String> category = ["الكل", "ادوات تجميل", "طعام", "ملابس"];
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

 Future<void> loadProducts() async {
  final data = await ApiService.getProducts();

  if (!mounted) return;

  setState(() {
    products = data;
    isLoading = false;
  });
}
bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Row(
                children: [
                  Text(
                    "suoq",
                    style: TextStyle(
                      color: UColor.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset("assets/icons/notevgation.svg"),
                  SizedBox(width: 20),
                  Icon(Icons.shopping_cart_outlined),
                ],
              ),
              SizedBox(height: 30),
              //Search
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  iconColor: Colors.grey,
                  prefixIcon: Icon(Icons.search),
                  hintText: "ابحث عن منتج ...",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontFamily: "Cairo",
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 20),
              //container
              Container(
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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

                      SizedBox(height: 20),
                      Text(
                        "عروض الصيف",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cairo",
                        ),
                      ),
                      Text(
                        "علي حميع الالكترونيات",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Cairo",
                        ),
                      ),
                      SizedBox(height: 20),

                      Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 25,
                          ),
                          child: Text(
                            "تسوق الان",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Cairo",
                            ),
                          ),
                        ),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: UColor.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 238, 236, 232),
                  border: Border.all(color: Colors.orange, width: 1),
                ),
              ),
              SizedBox(height: 20),

              //الاقسام
              Text(
                "الاقسام",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(category.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectedIndex == index
                                ? UColor.primary
                                : const Color.fromARGB(255, 237, 224, 206),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 7,
                              horizontal: 12,
                            ),
                            child: Text(
                              category[index],

                              style: TextStyle(
                                fontFamily: "Cairo",
                                color: selectedIndex == index
                                    ? Colors.white
                                    : UColor.primary,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

             isLoading
    ? const Center(
        child: CircularProgressIndicator(color: UColor.primary,),
      )
    :  GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Ditels(product: product),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      shadowColor: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  products[index].thumbnail,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    products[index].title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Cairo",
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (favoriteProducts.contains(product)) {
                                        favoriteProducts.remove(product);
                                      } else {
                                        favoriteProducts.add(product);
                                      }
                                    });
                                  },
                                  child: Icon(
                                    favoriteProducts.contains(product)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: favoriteProducts.contains(product)
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 5),

                            Row(
                              children: [
                                Text(
                                  "${products[index].price} ج",
                                  style: TextStyle(
                                    color: UColor.primary,
                                    fontFamily: "Cairo",
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 8),

                                ...List.generate(
                                  5,
                                  (i) => Icon(
                                    i < products[index].rating.round()
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                ),
                                Text(
                                  "(${products[index].rating})",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: "Cairo",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
