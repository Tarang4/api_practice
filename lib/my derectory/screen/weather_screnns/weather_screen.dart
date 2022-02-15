import 'dart:convert';
import 'package:api_prectic/my%20derectory/modal/weather_modal.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  List<WeatherModal> list = [];
  TextEditingController SearchText = TextEditingController();
  WeatherModal weatherModal = WeatherModal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getApiData(),
          builder: (BuildContext context, data) {
            if (data.hasData) {
              return apiDataLayout();
            } else if (data.hasError) {
              // print(data.error.toString());

              return Center(
                child: Container(
                  height: 200,
                  color: Colors.grey,
                  width: double.infinity,
                  child: Center(child: Text("hh:${data.error.toString()}")),
                ),
              );
            }
            return Center(child: const CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  getApiData() async {
    final uri = Uri.parse(
        "https://weatherbit-v1-mashape.p.rapidapi.com/forecast/3hourly?lat=21.17&lon=72.83");
    try {
      final response = await http.get(uri, headers: {
        'x-rapidapi-host': 'weatherbit-v1-mashape.p.rapidapi.com',
        'x-rapidapi-key': '2c9ee447ecmsh902d10cbb8ee130p1a19acjsnc4249e111316'
      });

      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        weatherModal = WeatherModal.fromJson(item);
        // item.forEach(
        //   (item) {
        //     WeatherModal commentModal = WeatherModal.fromJson(item);
        //     list.add(commentModal);
        //   },
        // );
        return weatherModal;
      } else {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception("please turn on Internet $e");
    }
  }

  Widget apiDataLayout() => Container(
        child: Card(
          elevation: 9,
          child: Container(
            width: double.infinity,
            color: Colors.amber,
            margin: EdgeInsets.all(18),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  controller: SearchText,
                ),
                Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.amber,
                    elevation: 7,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "CityName: ${weatherModal.cityName ?? ""}",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "lat: ${weatherModal.lat ?? ""}",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ), Text(
                            "Lon: ${weatherModal.lon ?? ""}",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Country Code= ${weatherModal.countryCode ?? ""}"),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Timezone= ${weatherModal.timezone ?? ""}"),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("State Code= ${weatherModal.stateCode ?? ""}"),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(height: 500,
                            child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Text(
                                        "Timezone= ${weatherModal.data![index].clouds ?? ""}"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // child: ListView.builder(
        //   itemCount: list.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     WeatherModal _commentModal = list[index];
        //     return Card(
        //       elevation: 9,
        //       child: Container(
        //         height: 230,
        //         width: double.infinity,
        //         color: Colors.amber,
        //         margin: EdgeInsets.all(18),
        //         padding: EdgeInsets.all(10),
        //         child: Card(
        //           color: Colors.amber,
        //           elevation: 7,
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 Text(
        //                   "Id= ${_commentModal.cityName ?? ""}",
        //                   style: TextStyle(fontSize: 20),
        //                 ),
        //                 const SizedBox(
        //                   height: 10,
        //                 ),
        //                 Text("Name= ${_commentModal.countryCode ?? ""}"),
        //                 const SizedBox(
        //                   height: 5,
        //                 ),
        //                 Text("Email= ${_commentModal.timezone ?? ""}"),
        //                 const SizedBox(
        //                   height: 5,
        //                 ),
        //                 Text("Body= ${_commentModal.stateCode ?? ""}"),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
      );
}
