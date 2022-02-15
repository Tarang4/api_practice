import 'dart:convert';

import 'package:api_prectic/sir%20derectory/modal/products_modal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductModal productModal = ProductModal();

  Data DataaModal = Data();
  List<Data> listData = [];
  List lisEtc = ["1", "2", "3", "d", "dd", "d", "d"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.89),
      body: SafeArea(
        child: FutureBuilder(
          future: getApiData(),
          builder: (BuildContext context, data) {
            return productWidget();
          },
        ),
      ),
    );
  }

  getApiData() async {
    final url = Uri.parse("https://www.omkartrading.live/v1/products");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        productModal = ProductModal.fromJson(item);
        return productModal;
      } else {
        throw Exception("error else : ");
      }
    } catch (e) {
      throw Exception("error : e");
    }
  }

  Widget productWidget() {
    final TextEditingController _search = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Omkar Trading",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.person,
                  size: 28,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    width: 44,
                    padding: EdgeInsets.only(left: 10, right: 1, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    child: Row(
                      children: [
                        Container(
                            height: 18,
                            margin: const EdgeInsets.only(top: 11, bottom: 11),
                            width: 18,
                            child: const Icon(
                              Icons.search,
                              size: 27,
                            )),
                        Expanded(
                          child: Container(
                            padding:
                                const EdgeInsets.only(bottom: 0.5, left: 13),
                            child: TextFormField(
                              controller: _search,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.normal),
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.bar_chart,
                    size: 30,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1000,
            padding: EdgeInsets.all(10.0),
            child: IntrinsicGridView.vertical(
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              columnCount: 2,
              verticalSpace: 20,
              horizontalSpace: 20,
              children: List.generate(
                productModal.data!.length,
                (index) {
                  Data dataModal = productModal.data![index];
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 10, right: 10, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 94,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 94,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  child: CachedNetworkImage(
                                    maxHeightDiskCache: 10,
                                    imageUrl: '${dataModal.imagesUrl ?? ""}',
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fadeOutDuration: const Duration(seconds: 1),
                                    fadeInDuration: const Duration(seconds: 3),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          // Container(
                          //   height: 94,
                          //   width: double.infinity,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(13),
                          //     color: Colors.grey.withOpacity(0.3),
                          //   ),
                          // child: CachedNetworkImage(
                          //   imageUrl: '${dataModal.imagesUrl?[index]}',
                          //   placeholder: (BuildContext context, String url) => Container(
                          //     width: 320,
                          //     height: 240,
                          //     color: Colors.purple,
                          //   ),
                          // ),),
                          Text(
                            dataModal.name ?? "",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\$ ${dataModal.price ?? ""} ",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
