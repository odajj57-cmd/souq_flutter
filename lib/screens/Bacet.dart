import 'package:flutter/material.dart';
import 'package:souq_application_1/Modile/modile.dart';
import 'package:souq_application_1/theme/color.dart';
import 'package:souq_application_1/uitlls/helps/CheckoutScreen.dart';
import 'package:souq_application_1/uitlls/helps/cart_data.dart';
import 'package:souq_application_1/uitlls/helps/costom_Bottom.dart';

class Backet extends StatefulWidget {
  const Backet({super.key});

  @override
  State<Backet> createState() => _BacketState();
}

class _BacketState extends State<Backet> {
  int addRemov = 1;

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var product in cartProducts) {
      total += product.price;
    }
    double discount = 5;

    double finalTotal = total - discount;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "سله التسوق",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
        child: cartProducts.isEmpty
            ? const Center(
                child: Text(
                  "لا يوجد منتجات في السلة",
                  style: TextStyle(fontSize: 20, fontFamily: "Cairo"),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartProducts.length,
                      itemBuilder: (context, index) {
                        final product = cartProducts[index];

                        return Card(
                          color: Colors.white,
                          shadowColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.network(
                                  product.thumbnail,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Cairo",
                                        ),
                                      ),

                                      const SizedBox(height: 10),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${product.price} ج",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: UColor.primary,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Cairo",
                                            ),
                                          ),

                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                cartProducts.removeAt(index);
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.delete_outline,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.add),
                                              SizedBox(width: 10),
                                              Text("$addRemov"),
                                              SizedBox(width: 10),
                                              Icon(Icons.remove),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Divider(),

                  Row(
                    children: [
                      Text(
                        "المجموع",
                        style: TextStyle(fontSize: 20, fontFamily: "Cairo"),
                      ),
                      Spacer(),
                      Text(
                        "${total.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 20, fontFamily: "Cairo"),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "المجموع",
                        style: TextStyle(fontSize: 20, fontFamily: "Cairo"),
                      ),
                      Spacer(),
                      Text(
                        "مجاني",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Cairo",
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  Row(
                    children: [
                      Text(
                        "الخصم",
                        style: TextStyle(fontSize: 20, fontFamily: "Cairo"),
                      ),
                      Spacer(),
                      Text(
                        "-$discount ج",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Cairo",
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 20),

                  Row(
                    children: [
                      Text(
                        "الاجمالي",
                        style: TextStyle(fontSize: 20, fontFamily: "Cairo"),
                      ),
                      Spacer(),
                      Text(
                        "${finalTotal.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Cairo",
                          color: UColor.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>CheckoutScreen()));
                    },
                    child: CostomBottom(
                      text: "اتمام الشراء",
                      color: UColor.primary,
                      colorText: Colors.white,
                      icon: Icons.arrow_outward_outlined,
                      colorIcon: Colors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
