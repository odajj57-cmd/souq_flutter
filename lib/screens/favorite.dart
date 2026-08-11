import 'package:flutter/material.dart';
import 'package:souq_application_1/theme/color.dart';

import 'package:souq_application_1/uitlls/helps/cart_data.dart';
import 'package:souq_application_1/uitlls/helps/favorite_data.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
                backgroundColor: Colors.white,

        title: Text(
          "المفضله",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
          child:
              favoriteProducts.isEmpty
                  ? const Center(
                      child: Text(
                        "لا يوجد منتجات في المفضله",
                        style: TextStyle(fontSize: 20, fontFamily: "Cairo"),
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: favoriteProducts.length,
                            itemBuilder: (context, index) {
                              final product = favoriteProducts[index];
        
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
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    product.title,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: "Cairo",
                                                    ),
                                                  ),
                                                ),
        
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      favoriteProducts.removeAt(
                                                        index,
                                                      );
                                                    });
                                                  },
                                                  icon: const Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
        
                                            const SizedBox(height: 10),
        
                                            Row(
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
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      cartProducts.add(product);
                                                    });
        
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          "تمت إضافة المنتج للسلة",
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                      color: UColor.primary,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            8.0,
                                                          ),
                                                      child: Text(
                                                        "اضف للسله",
                                                        style: TextStyle(
                                                          fontFamily: "Cairo",
                                                          fontSize: 17,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                      ],
                    ),
           
        ),
      ),
    );
  }
}
