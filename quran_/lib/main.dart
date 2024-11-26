// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:audioplayers/audioplayers.dart';
// import 'dart:async';
// import 'dart:convert';

// void main() {
//   runApp(
//     MaterialApp(
//       theme: ThemeData(
//         brightness: Brightness.light,
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//       ),
//       themeMode: ThemeMode.dark,
//       debugShowCheckedModeBanner: false,
//       home: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatefulWidget {
//   MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
//   Brightness? _brightness;
//   @override
//   void initState() {
//     WidgetsBinding.instance?.addObserver(this);
//     _brightness = WidgetsBinding.instance?.window.platformBrightness;
//     super.initState();
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance?.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangePlatformBrightness() {
//     if (mounted) {
//       setState(() {
//         _brightness = WidgetsBinding.instance?.window.platformBrightness;
//       });
//     }

//     super.didChangePlatformBrightness();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(
//               "https://i.pinimg.com/736x/76/f0/79/76f07999c5951faba105fa680bfe8202.jpg",
//             ),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Quran App",
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w900,
//                     color: Color.fromARGB(255, 0, 255, 8),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Har kuni Quron o'rganing",
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: Color.fromARGB(255, 0, 255, 8),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             Container(
//               height: 600,
//               width: 500,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     left: 85,
//                     child: Container(
//                       height: 530,
//                       width: 330,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(
//                             "https://i.pinimg.com/564x/e3/f0/8c/e3f08c961e00df85aa3bc0e836085c18.jpg",
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: BorderRadius.circular(
//                           50,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 480,
//                     left: 120,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Sahifa(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         height: 100,
//                         width: 260,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(
//                             75,
//                           ),
//                         ),
//                         child: Center(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 "   keyingi sahifa",
//                                 style: TextStyle(
//                                   fontSize: 22,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Icon(
//                                 Icons.arrow_forward_ios,
//                                 color: Colors.black,
//                                 size: 25,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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

//   bool isLoading1 = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(
//               "https://i.pinimg.com/736x/ed/60/c9/ed60c954c56b37bfc801998b770a794c.jpg",
//             ),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 50),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Quran App",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w900,
//                     fontSize: 30,
//                     color: Color.fromARGB(255, 0, 255, 8),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Center(
//                   child: Text(
//                     "Assalomu Aleykum \n    va rahmatulloh",
//                     style: TextStyle(
//                       fontSize: 25,
//                       color: Color.fromARGB(255, 0, 255, 8),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               height: 235,
//               width: 460,
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color.fromARGB(
//                       255,
//                       0,
//                       255,
//                       8,
//                     ),
//                     offset: Offset(
//                       5,
//                       5,
//                     ),
//                     blurRadius: 10,
//                   ),
//                 ],
//                 borderRadius: BorderRadius.circular(25),
//                 color: Colors.grey[100],
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(8.5),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               "Quroni karimning\n  30 Pora",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w900,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           height: 180,
//                           width: 140,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage(
//                                 'https://i.pinimg.com/564x/e2/8b/35/e28b3500f009332209532513119f80a2.jpg',
//                               ),
//                               fit: BoxFit.fitHeight,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   if (isLoading1) {
//                     return Scaffold(
//                       body: Center(
//                         child: CircularProgressIndicator(),
//                       ),
//                     );
//                   }
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SurahData(
//                             salom: data[index],
//                           ),
//                         ),
//                       );
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.all(15),
//                       child: Container(
//                         height: 150,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.white,
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(10),
//                           child: Row(
//                             children: [
//                               Text(
//                                 "${data[index]['number']}.  ",
//                                 style: TextStyle(
//                                   fontSize: 25,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 "${data[index]['englishName']},   ",
//                                 style: TextStyle(
//                                   fontSize: 22,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 "${data[index]['name']},   ",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 "${data[index]['revelationType']}",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SurahData extends StatefulWidget {
//   final Map<String, dynamic> salom;

//   const SurahData({required this.salom});

//   @override
//   _SurahDataState createState() => _SurahDataState();
// }

// class _SurahDataState extends State<SurahData> {
//   List<Map<String, dynamic>> ayahs = [];
//   bool isLoading = true;
//   AudioPlayer audioPlayer = AudioPlayer();
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;
//   String? currentAudioUrl;
//   int currentAyahIndex = 0;
//   bool isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     fetchSurahDetails();
//     setupAudioCompletionListener();
//   }

//   Future<void> fetchSurahDetails() async {
//     final int surahNumber = widget.salom['number'];
//     final response = await http.get(
//       Uri.parse("https://api.alquran.cloud/v1/surah/$surahNumber/ar.alafasy"),
//     );

//     if (response.statusCode == 200) {
//       final jsondata = jsonDecode(response.body);
//       setState(() {
//         ayahs = (jsondata['data']['ayahs'] as List)
//             .map((item) => Map<String, dynamic>.from(item))
//             .toList();
//         isLoading = false;
//       });
//     } else {
//       throw Exception("Failed to load surah details");
//     }
//   }

//   void setupAudio(String url, int index) async {
//     if (currentAudioUrl != url) {
//       await audioPlayer.setSourceUrl(url);
//       currentAudioUrl = url;
//     }

//     setState(() {
//       currentAyahIndex = index;
//       isPlaying = true;
//     });

//     audioPlayer.onDurationChanged.listen((Duration newDuration) {
//       setState(() {
//         duration = newDuration;
//       });
//     });

//     audioPlayer.onPositionChanged.listen((Duration newPosition) {
//       setState(() {
//         position = newPosition;
//       });
//     });

//     audioPlayer.resume();
//   }

//   void setupAudioCompletionListener() {
//     // Listen for audio completion
//     audioPlayer.onPlayerComplete.listen((event) {
//       if (currentAyahIndex < ayahs.length - 1) {
//         setState(() {
//           currentAyahIndex++;
//         });
//         // Play the next Ayah automatically
//         String nextAudioUrl = ayahs[currentAyahIndex]['audio'] ?? '';
//         if (nextAudioUrl.isNotEmpty) {
//           setupAudio(nextAudioUrl, currentAyahIndex);
//         }
//       } else {
//         // Stop playing if it's the last Ayah
//         setState(() {
//           isPlaying = false;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.salom['englishName'] ?? 'Surah'),
//         ),
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.salom['englishName'] ?? 'Surah'),
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(
//               "https://i.pinimg.com/736x/82/d3/37/82d33774c7db84eaeccc106045cd3ec9.jpg",
//             ),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(
//             10,
//           ),
//           child: ListView.builder(
//             itemCount: ayahs.length,
//             itemBuilder: (context, index) {
//               final ayah = ayahs[index];
//               bool isCurrentAyah = index == currentAyahIndex;

//               return Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Card(
//                   color: isCurrentAyah
//                       ? const Color.fromARGB(255, 0, 244, 8)
//                       : Colors.white,
//                   child: ListTile(
//                     title: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "${ayah['text'] ?? ''}",
//                           style: TextStyle(
//                             fontSize: 25,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w900,
//                           ),
//                         ),
//                       ],
//                     ),
//                     trailing: IconButton(
//                       icon: Icon(
//                         isCurrentAyah && isPlaying
//                             ? Icons.pause
//                             : Icons.play_arrow,
//                       ),
//                       onPressed: () {
//                         if (isCurrentAyah && isPlaying) {
//                           // Pause if currently playing this Ayah
//                           audioPlayer.pause();
//                           setState(() {
//                             isPlaying = false;
//                           });
//                         } else {
//                           // Play the selected Ayah
//                           setupAudio(ayah['audio'] ?? '', index);
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

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
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _brightness = WidgetsBinding.instance.window.platformBrightness;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      setState(() {
        _brightness = WidgetsBinding.instance.window.platformBrightness;
      });
    }
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://i.pinimg.com/736x/76/f0/79/76f07999c5951faba105fa680bfe8202.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
            SizedBox(height: 25),
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
                        borderRadius: BorderRadius.circular(50),
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
                          borderRadius: BorderRadius.circular(75),
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
  bool isLoading1 = true;

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse("https://api.alquran.cloud/v1/quran/uz.sodik"),
    );

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body);
      final surahs = jsondata['data']['surahs'] as List;
      setState(() {
        data = surahs.map((item) => Map<String, dynamic>.from(item)).toList();
        isLoading1 = false;
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://i.pinimg.com/736x/ed/60/c9/ed60c954c56b37bfc801998b770a794c.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
              width: 460,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 255, 8),
                    offset: Offset(5, 5),
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
                                color: Colors.black,
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
            SizedBox(height: 30),
            Expanded(
              child: isLoading1
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SurahData(
                                  salom: data[index],
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(
                                  255,
                                  0,
                                  253,
                                  8,
                                ),
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
                                      "${data[index]['englishName']} surasi",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
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
      ),
    );
  }
}

class SurahData extends StatefulWidget {
  final Map<String, dynamic> salom;

  const SurahData({required this.salom});

  @override
  _SurahDataState createState() => _SurahDataState();
}

class _SurahDataState extends State<SurahData> {
  List<Map<String, dynamic>> ayahs = [];
  bool isLoading = true;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String? currentAudioUrl;
  int currentAyahIndex = 0;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    fetchSurahDetails();
    setupAudioCompletionListener();
  }

  Future<void> fetchSurahDetails() async {
    final int surahNumber = widget.salom['number'];
    final response = await http.get(
      Uri.parse("https://api.alquran.cloud/v1/surah/$surahNumber/ar.alafasy"),
    );

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body);
      setState(() {
        ayahs = (jsondata['data']['ayahs'] as List)
            .map((item) => Map<String, dynamic>.from(item))
            .toList();
        isLoading = false;
      });
    } else {
      throw Exception("Failed to load surah details");
    }
  }

  void setupAudio(String url, int index) async {
    if (currentAudioUrl != url) {
      await audioPlayer.setSourceUrl(url);
      currentAudioUrl = url;
    }

    setState(() {
      currentAyahIndex = index;
      isPlaying = true;
    });

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

    audioPlayer.resume();
  }

  void setupAudioCompletionListener() {
    // Listen for audio completion
    audioPlayer.onPlayerComplete.listen((event) {
      if (currentAyahIndex < ayahs.length - 1) {
        setState(() {
          currentAyahIndex++;
        });
        // Play the next Ayah automatically
        String nextAudioUrl = ayahs[currentAyahIndex]['audio'] ?? '';
        if (nextAudioUrl.isNotEmpty) {
          setupAudio(nextAudioUrl, currentAyahIndex);
        }
      } else {
        // Stop playing if it's the last Ayah
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.salom['englishName'] ?? 'Surah'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.salom['englishName'] ?? 'Surah',
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://i.pinimg.com/736x/82/d3/37/82d33774c7db84eaeccc106045cd3ec9.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            10,
          ),
          child: ListView.builder(
            itemCount: ayahs.length,
            itemBuilder: (context, index) {
              final ayah = ayahs[index];
              bool isCurrentAyah = index == currentAyahIndex;

              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  color: isCurrentAyah
                      ? const Color.fromARGB(255, 0, 244, 8)
                      : Colors.white,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${ayah['text'] ?? ''}",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isCurrentAyah && isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onPressed: () {
                        if (isCurrentAyah && isPlaying) {
                          // Pause if currently playing this Ayah
                          audioPlayer.pause();
                          setState(() {
                            isPlaying = false;
                          });
                        } else {
                          // Play the selected Ayah
                          setupAudio(ayah['audio'] ?? '', index);
                        }
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
