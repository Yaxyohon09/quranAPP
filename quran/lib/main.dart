import 'package:audioplayers/audioplayers.dart'; // Import the audioplayers package
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
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Quran",
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
                    left: 80,
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
                    left: 110,
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
                        width: 280,
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
                                " keyingi sahifa ",
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
  List<Map<String, dynamic>> data1 = [];
  bool loading = true; // Track loading state

  Future<void> fet() async {
    setState(() {
      loading = true;
    });

    try {
      final response = await http.get(
        Uri.parse(
          "https://api.alquran.cloud/v1/quran/quran-simple",
        ),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final surahs = jsonData['data']['surahs'] as List;
        data = surahs.map((item) => Map<String, dynamic>.from(item)).toList();
      } else {
        throw Exception(
          "Failed to load data",
        );
      }
    } catch (e) {
      // Handle the error gracefully here
      print('Error fetching data: $e');
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> audio() async {
    setState(() {
      loading = true;
    });

    final response1 = await http.get(
      Uri.parse("https://mp3quran.net/api/v3/languages"),
    );
    if (response1.statusCode == 200) {
      final jsonData1 = jsonDecode(response1.body);
      final surahs1 = jsonData1['language']['surah'] as List;
      data1 = surahs1.map((item1) => Map<String, dynamic>.from(item1)).toList();
    } else {
      throw Exception(
        "Failed to load data",
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fet();
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
              "https://i.pinimg.com/736x/1c/dd/11/1cdd11cb77191587ad2ff4959f38a5b8.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.green,
                  ),
                ),
              )
            : Column(
                children: [
                  Text(
                    "Quran",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Color.fromARGB(255, 0, 255, 8),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Assalomu Aleykum \nva rahmatulloh",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 0, 255, 8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 235,
                    width: 450,
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
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final surah = data[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SurahDetailPage(
                                  surah: surah,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(
                                16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 0, 255, 8),
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${surah['number']}.",
                                        style: TextStyle(
                                          fontSize: 35,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            surah[
                                                'name'], // Arabic name of Surah
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            surah['englishName'],
                                          ),
                                        ],
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
                  ),
                ],
              ),
      ),
    );
  }
}

class SurahDetailPage extends StatefulWidget {
  final Map<String, dynamic> surah;

  SurahDetailPage({required this.surah});

  @override
  _SurahDetailPageState createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  AudioPlayer _audioPlayer = AudioPlayer();
  Duration _duration = Duration();
  Duration _position = Duration();
  String? audioUrl;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    fetchAudioUrl();

    // Listen to changes in the duration of the audio
    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    // Listen to changes in the position of the audio using the positionStream
    _audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });
  }

  Future<void> fetchAudioUrl() async {
    try {
      // Fetch the audio URL for the specific Surah
      final response = await http.get(
        Uri.parse("https://mp3quran.net/api/v3/languages"), // Your API URL
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        // Use the proper field to get the Surah audio URL
        setState(() {
          audioUrl = "YOUR_AUDIO_URL"; // Replace with the actual audio URL
        });
      } else {
        throw Exception("Failed to load audio data");
      }
    } catch (e) {
      print('Error fetching audio data: $e');
    }
  }

  void playPauseAudio() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      if (audioUrl != null) {
        await _audioPlayer.play(UrlSource(audioUrl!));
      }
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void seekAudio(double value) {
    final position = Duration(seconds: value.toInt());
    _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
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
              "https://i.pinimg.com/736x/7b/ef/1d/7bef1dcca0dd10c62d807578ab35b1ac.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Surah Arabic name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BackButton(
                    color: Colors.green,
                  ),
                  Text(
                    widget.surah['englishName'],
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.surah['name'], // Arabic name
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // Audio Playback Controls
              if (audioUrl != null) ...[
                IconButton(
                  icon: Icon(
                    isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                    size: 50,
                    color: Colors.green,
                  ),
                  onPressed: playPauseAudio,
                ),
                Slider(
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  min: 0,
                  max: _duration.inSeconds.toDouble(),
                  value: _position.inSeconds
                      .toDouble()
                      .clamp(0.0, _duration.inSeconds.toDouble()),
                  onChanged: seekAudio,
                ),
                Text(
                  "${_position.toString().split('.').first} / ${_duration.toString().split('.').first}",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
              ],
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.surah['ayahs'].length,
                  itemBuilder: (context, index) {
                    final ayah = widget.surah['ayahs'][index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Display the Arabic text of the Ayah
                          Text(
                            "${ayah['number']}-oyat. ${ayah['text']}", // Arabic Ayah text
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
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
