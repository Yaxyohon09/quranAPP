import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Brightness? _brightness;
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    _brightness = WidgetsBinding.instance?.window.platformBrightness;
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      setState(() {
        _brightness = WidgetsBinding.instance?.window.platformBrightness;
      });
    }

    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Har kuni Quron o'rganing",
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
                  left: 85,
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
                  left: 120,
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
                                fontSize: 22,
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
  @override
  State<Sahifa> createState() => _SahifaState();
}

class _SahifaState extends State<Sahifa> {
  List<Map<String, dynamic>> data = [];
  bool kutish = true;

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse("https://api.alquran.cloud/v1/quran/uz.sodik"),
    );

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body);
      final surahs = jsondata['data']['surahs'] as List;
      setState(() {
        data = surahs.map((item) => Map<String, dynamic>.from(item)).toList();
      });
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
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
                  color: Color.fromARGB(
                    255,
                    0,
                    255,
                    8,
                  ),
                  offset: Offset(
                    5,
                    5,
                  ),
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey[100],
            ),
            child: Padding(
              padding: EdgeInsets.all(8.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Quroni karimning\n  30 Pora",
                            style: TextStyle(
                              fontSize: 20,
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
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SurahDetail(surahData: data[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(
                              "${data[index]['number']}.  ",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${data[index]['englishName']},   ",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${data[index]['name']},   ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${data[index]['revelationType']}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SurahDetail extends StatefulWidget {
  final Map<String, dynamic> surahData;

  SurahDetail({required this.surahData});

  @override
  _SurahDetailState createState() => _SurahDetailState();
}

class _SurahDetailState extends State<SurahDetail> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    // Load the audio for this Surah
    String? audioUrl = widget.surahData['surah'] as String?;

    // Check if audioUrl is not null
    if (audioUrl != null && audioUrl.isNotEmpty) {
      setupAudio(audioUrl);
    } else {
      print('Audio URL is null or empty');
    }
  }

  void setupAudio(String url) async {
    await audioPlayer.setSourceUrl(url);

    audioPlayer.onDurationChanged.listen((Duration newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((Duration newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ayahs = widget.surahData['ayahs'] as List<dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surahData['englishName'] ?? 'Surah'),
      ),
      body: Column(
        children: [
          // Slider for audio control
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds
                .toDouble()
                .clamp(0.0, duration.inSeconds.toDouble()),
            onChanged: (value) async {
              final newPosition = Duration(seconds: value.toInt());
              await audioPlayer.seek(newPosition);
              setState(() {
                position = newPosition;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ayahs.length,
              itemBuilder: (context, index) {
                final ayah = ayahs[index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      "${ayah['text'] ?? ''}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (audioPlayer.state == PlayerState.playing) {
            audioPlayer.pause();
          } else {
            audioPlayer.resume();
          }
        },
        child: Icon(
          audioPlayer.state == PlayerState.playing
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
    );
  }
}
// class Sahifa extends StatefulWidget {
//   @override
//   State<Sahifa> createState() => _SahifaState();
// }

// class _SahifaState extends State<Sahifa> {
//   List<Map<String, dynamic>> data = [];
//   bool kutish = true;

//   Future<void> fetchData() async {
//     final response = await http.get(
//       Uri.parse("https://api.alquran.cloud/v1/quran/uz.sodik"),
//     );

//     if (response.statusCode == 200) {
//       final jsondata = jsonDecode(response.body);
//       final surahs = jsondata['data']['surahs'] as List;
//       setState(() {
//         data = surahs.map((item) => Map<String, dynamic>.from(item)).toList();
//       });
//     } else {
//       throw Exception("Failed to load data");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(height: 50),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Quran App",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w900,
//                   fontSize: 30,
//                   color: Color.fromARGB(255, 0, 255, 8),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 child: Text(
//                   "Assalomu Aleykum \n    va rahmatulloh",
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: Color.fromARGB(255, 0, 255, 8),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             height: 235,
//             width: 350,
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromARGB(
//                     255,
//                     0,
//                     255,
//                     8,
//                   ),
//                   offset: Offset(
//                     5,
//                     5,
//                   ),
//                   blurRadius: 10,
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(25),
//               color: Colors.grey[100],
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(8.5),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             "Quroni karimning\n  30 Pora",
//                             style: TextStyle(
//                               // fontSize: 0,
//                               fontWeight: FontWeight.w900,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         height: 180,
//                         width: 140,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(
//                               'https://i.pinimg.com/564x/e2/8b/35/e28b3500f009332209532513119f80a2.jpg',
//                             ),
//                             fit: BoxFit.fitHeight,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             SurahDetail(surahData: data[index]),
//                       ),
//                     );
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.all(15),
//                     child: Container(
//                       height: 150,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.white,
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "${data[index]['englishName']}",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               "${data[index]['name']}",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.grey[700],
//                               ),
//                             ),
//                             SizedBox(height: 5),
//                             Text(
//                               "${data[index]['revelationType']}",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SurahDetail extends StatelessWidget {
//   final Map<String, dynamic> surahData;

//   SurahDetail({required this.surahData});

//   @override
//   Widget build(BuildContext context) {
//     final ayahs = surahData['ayahs'] as List<dynamic>;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(surahData['englishName']),
//       ),
//       body: Column(
//         children: [
//           Slider(
//                 min: 0,
//                 max: duration.inSeconds.toDouble(),
//                 // value: position.inSeconds.toDouble(),
//                 value: position.inSeconds
//                     .toDouble()
//                     .clamp(0.0, duration.inSeconds.toDouble()),
//                 onChanged: (value) async {
//                   final newPosition = Duration(seconds: value.toInt());
//                   await audioplayer.seek(newPosition);
//                   setState(() {
//                     position = newPosition;
//                   });
//                 },
//               ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: ayahs.length,
//               itemBuilder: (context, index) {
//                 final ayah = ayahs[index];
//                 return Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: ListTile(
//                     title: Text(
//                       "${ayah['text']}",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
