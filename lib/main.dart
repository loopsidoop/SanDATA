import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

// Stateful widget para gumana yung navigation
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// Code for home page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FF),
      appBar: const CustomBarApp(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.0,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                padding: const EdgeInsets.all(25),
                crossAxisCount: 2,
                // Number of columns in the grid
                children: [
                  gridButton(
                    context,
                    const DataBreach(),
                    Icons.search,
                    'Check if you’re \ninvolved in data \nbreaches',
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       launchUrl(Uri.parse('https://haveibeenpwned.com/'),
                  //           mode: LaunchMode.inAppBrowserView);
                  //     });
                  //
                  gridButton(
                    context,
                    const PassManagers(),
                    Icons.lock,
                    'Trusted Password Managers',
                  ),
                  gridButton(
                    context,
                    const SecureWebs(),
                    Icons.language,
                    'Secure Web \nBrowsers',
                  ),
                  gridButton(
                    context,
                    const LearnResources(),
                    Icons.library_books_outlined,
                    'Learning \nResources',
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MidButton(
                    urlLink: 'https://privacy.gov.ph/file-a-complaint/',
                    fg: Color.fromRGBO(12, 53, 106, 1),
                    bg: Color.fromRGBO(255, 196, 54, 1.0),
                    icon: Icons.warning_amber,
                    titleText: "Report a website or app",
                    subText:
                        'Tap here to report a dangerous website or software \nto the National Privacy Commission (NPC)',
                    titleFontSize: 16.0,
                    subFontSize: 11.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MidButton(
                      urlLink: 'https://easydmarc.com/tools/phishing-url',
                      fg: Colors.white,
                      bg: Color(0xFF0174BE),
                      icon: Icons.check_circle_outline,
                      titleText: "Verify an unknown link",
                      subText:
                          'Unsure whether or not a link is safe? \nVerify it using our Link Verifier™',
                      titleFontSize: 17.0,
                      subFontSize: 12.0),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.47,
                    height: 225,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(12, 53, 106,
                            1), // Border color for the first container
                        width: 2.0, // Border width for the first container
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "You might \nbe using a \nDangerous \nwebsite.",
                              style: TextStyle(
                                fontFamily: 'IntroRust',
                                fontSize: 15,
                                color: Color.fromRGBO(12, 53, 106, 1),
                              ),
                            ),
                            Icon(
                              Icons.ring_volume_outlined,
                              size: 50,
                              color: Color.fromRGBO(12, 53, 106, 1),
                            ),
                          ],
                        ),
                        const Text(
                          "Our service keeps track and records reported website/application that are deemed a threat to data privacy.",
                          style: TextStyle(
                            fontFamily: 'RusticPrinted',
                            fontSize: 13,
                            height: 1.0,
                            color: Color.fromRGBO(12, 53, 106, 1),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext builder) =>
                                    const DangerSites(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(12, 53, 106, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            padding: const EdgeInsets.all(10),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Check Here",
                                style: TextStyle(
                                  fontFamily: 'IntroRust',
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.play_circle_outline_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.47,
                    height: 225,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(12, 53, 106,
                            1), // Border color for the first container
                        width: 2.0, // Border width for the first container
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Something's\nPhishy...",
                              style: TextStyle(
                                fontFamily: 'IntroRust',
                                fontSize: 15,
                                color: Color.fromRGBO(12, 53, 106, 1),
                              ),
                            ),
                            Expanded(
                              child: Icon(
                                Icons.search,
                                size: 50,
                                color: Color.fromRGBO(12, 53, 106, 1),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "Learn how to discern legit websites from phishing scams. Challenge Bobby Phisher and break past his deceptive tricks to win!",
                          style: TextStyle(
                            fontFamily: 'RusticPrinted',
                            fontSize: 13,
                            height: 1.0,
                            color: Color.fromRGBO(12, 53, 106, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext builder) =>
                                    const Phishy(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(12, 53, 106, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            padding: const EdgeInsets.all(10),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Play Now!",
                                style: TextStyle(
                                  fontFamily: 'IntroRust',
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.play_circle_outline_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// Design for the AppBar
class CustomBarApp extends StatefulWidget implements PreferredSizeWidget {
  const CustomBarApp({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  State<CustomBarApp> createState() => _CustomBarAppState();
}

class _CustomBarAppState extends State<CustomBarApp> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            'images/sandata_icon.png',
            width: 50,
            height: 50,
          ),
          RichText(
            text: const TextSpan(
              text: 'San',
              style: TextStyle(
                  color: Colors.white, fontSize: 40, fontFamily: 'IntroRust'),
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'Data',
              style: TextStyle(
                  color: Color.fromRGBO(255, 196, 54, 1.0),
                  fontSize: 40,
                  fontFamily: 'IntroRust'),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF0C356A),
    );
  }
}

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "\n\n\n\nCOMING SOON!!!!\n\n\n\n",
          style: TextStyle(
            fontFamily: "IntroRust",
          ),
        ),
        Image.asset('images/rofl.png'),
      ],
    );
  }
}

class DataBreach extends StatelessWidget {
  const DataBreach({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomBarApp(),
      body: ComingSoon(),
    );
  }
}

// Password Managers Page
class PassManagers extends StatelessWidget {
  const PassManagers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomBarApp(),
      body: ComingSoon(),
    );
  }
}

// Web Browser Page
class SecureWebs extends StatelessWidget {
  const SecureWebs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomBarApp(),
      body: ComingSoon(),
    );
  }
}

// Learning Resource Page
class LearnResources extends StatelessWidget {
  const LearnResources({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomBarApp(),
      body: ComingSoon(),
    );
  }
}

//Dangerous Websites
class DangerSites extends StatelessWidget {
  const DangerSites({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomBarApp(),
      body: ComingSoon(),
    );
  }
}

//Play this mf
class Phishy extends StatefulWidget {
  const Phishy({super.key});

  @override
  State<Phishy> createState() => _PhishyState();
}

class _PhishyState extends State<Phishy> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomBarApp(),
      body: ComingSoon(),
    );
  }
}

// Gridview ElevatedBUtton style
Widget gridButton(
  BuildContext context,
  Widget page,
  IconData icon,
  String text,
) {
  return ElevatedButton(
    onPressed: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext builder) => page));
    },
    style: ElevatedButton.styleFrom(
      elevation: 1.5,
      shadowColor: Colors.grey,
      backgroundColor: Colors.white,
      foregroundColor: const Color.fromRGBO(12, 53, 106, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      padding: const EdgeInsets.all(5),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: 'RusticPrinted',
            height: 0.8,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

// Button at middle
class MidButton extends StatefulWidget {
  final String urlLink;
  final Color fg;
  final Color bg;
  final IconData icon;
  final String titleText;
  final String subText;
  final double titleFontSize;
  final double subFontSize;

  const MidButton({
    super.key,
    required this.urlLink,
    required this.fg,
    required this.bg,
    required this.icon,
    required this.titleText,
    required this.subText,
    required this.titleFontSize,
    required this.subFontSize,
  });

  @override
  State<MidButton> createState() => _MidButtonState();
}

class _MidButtonState extends State<MidButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          launchUrl(Uri.parse(widget.urlLink),
              mode: LaunchMode.inAppBrowserView);
        });
      },
      style: ElevatedButton.styleFrom(
        elevation: 3,
        shadowColor: Colors.grey,
        foregroundColor: widget.fg,
        backgroundColor: widget.bg,
        padding: const EdgeInsets.all(11),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10.0),
      //     ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 60,
          ),
          const SizedBox(
            width: 7,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.titleText,
                style: TextStyle(
                  fontSize: widget.titleFontSize,
                  fontFamily: 'IntroRust',
                ),
              ),
              Text(
                widget.subText,
                style: TextStyle(
                  height: 1,
                  fontSize: widget.subFontSize,
                  fontFamily: 'RusticPrinted',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

// ElevatedButton(
//                     onPressed: () {
//                       setState(
//                         () {
//                           launchUrl(
//                             Uri.parse(
//                                 'https://privacy.gov.ph/file-a-complaint/'),
//                             mode: LaunchMode.inAppBrowserView,
//                           );
//                         },
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       elevation: 3,
//                       shadowColor: Colors.grey,
//                       foregroundColor: const Color.fromRGBO(12, 53, 106, 1),
//                       backgroundColor: const Color.fromRGBO(255, 196, 54, 1.0),
//                       padding: const EdgeInsets.all(11),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     child: const Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.warning_amber,
//                           size: 60,
//                         ),
//                         SizedBox(
//                           width: 7,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           //mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Report a website or app",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontFamily: 'IntroRust',
//                               ),
//                             ),
//                             Text(
//                               'Tap here to report a dangerous website or software \nto the National Privacy Commission (NPC)',
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                 height: 1,
//                                 fontSize: 11,
//                                 fontFamily: 'RusticPrinted',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),