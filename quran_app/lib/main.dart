import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 120,
              ),
              Text(
                "Quran App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 0, 255, 8),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 60,
              ),
              Text(
                "Har kuni Quran o'rganing",
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 0, 255, 8),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 600,
            width: 500,
            child: Stack(
              children: [
                Positioned(
                  left: 32,
                  child: Container(
                    height: 530,
                    width: 330,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://i.pinimg.com/564x/e3/f0/8c/e3f08c961e00df85aa3bc0e836085c18.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: Color.fromARGB(255, 0, 255, 8),
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 480,
                  left: 65,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Sahifa(),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 260,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          75,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "   keyingi sahifa",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Sahifa extends StatefulWidget {
  Sahifa({super.key});

  @override
  State<Sahifa> createState() => _SahifaState();
}

class _SahifaState extends State<Sahifa> {
  List<Map<String, dynamic>> data = [];
  Future<void> fet() async {
    final response = await http.get(
      Uri.parse(
        "https://api.alquran.cloud/v1/quran/uz.sodik",
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsondata = jsonDecode(response.body);

      for (var item in jsondata) {
        data.add(
          Map<String, dynamic>.from(
            item,
          ),
        );
      }
      setState(() {});
    } else {
      throw Exception(
        "Failed to lood",
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quran App",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Color.fromARGB(255, 0, 255, 8),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Assalomu Aleykum \n    va rahmatulloh",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 0, 255, 8),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 235,
            width: 350,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 255, 8),
                  offset: Offset(
                    5,
                    5,
                  ),
                  blurRadius: BorderSide.strokeAlignOutside,
                ),
              ],
              borderRadius: BorderRadius.circular(
                25,
              ),
              color: Colors.grey[100],
            ),
            child: Padding(
              padding: EdgeInsets.all(
                8.5,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Quroni karimning\n  30 Pora",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 180,
                        width: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://i.pinimg.com/564x/e2/8b/35/e28b3500f009332209532513119f80a2.jpg',
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(
                  15,
                ),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "${data[index]['englishName']}",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
