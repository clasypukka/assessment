import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  String selectedOption = "D"; // Default selected

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Colors.black,
      body: Expanded(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.5,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        "images/bg.jpeg",
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black87],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Stroll Bonfire",
                                  style: GoogleFonts.poppins(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple[200],
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 25,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.timer_outlined,
                                    size: 25, color: Colors.white),
                                SizedBox(width: 5),
                                Text("22h 00m",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(width: 15),
                                Icon(Icons.person_outline,
                                    size: 27, color: Colors.white70),
                                SizedBox(width: 5),
                                Text("103",
                                    style: TextStyle(color: Colors.white70)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Bottom content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              CircleAvatar(
                                  backgroundImage:
                                      AssetImage("images/user.jpg")),
                              SizedBox(width: 6),
                              Text("Angelina, 28",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text(
                              "What is your favorite time of the day?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Center(
                            child: const Text(
                              "\"Mine is definitely the peace in the morning.\"",
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 27.0),
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                optionButton(
                                    "A", "The peace in the early mornings"),
                                optionButton("B", "The magical golden hours"),
                                optionButton(
                                    "C", "Wind-down time after dinners"),
                                optionButton("D", "The serenity past midnight"),
                              ],
                            ),
                          ),
                          // Spacer(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Pick your option.\nSee who has a similar mind.",
                                style: TextStyle(color: Colors.white70),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.purple, width: 2),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: const Icon(Icons.mic,
                                      color: Colors.purple),
                                ),
                              ),
                              const SizedBox(width: 10),
                              CircleAvatar(
                                backgroundColor: Colors.purple[300],
                                child: const Icon(Icons.arrow_forward,
                                    color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.purple[300],
        // unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.style,
                color: Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_fire_department,
                color: Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message_rounded,
                color: Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: Colors.grey,
              ),
              label: ''),
        ],
      ),
    );
  }

  Widget optionButton(String label, String text) {
    final isSelected = selectedOption == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = label;
        });
      },
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : Colors.grey[850],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.purple.shade700 : Colors.transparent,
          ),
        ),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "$label. ",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: text),
            ],
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
