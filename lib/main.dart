import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
                // Gridview properties
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.0,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                padding: const EdgeInsets.all(25),
                crossAxisCount: 2,
                // Number of columns in the grid
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          launchUrl(Uri.parse('https://haveibeenpwned.com/'),
                              mode: LaunchMode.inAppBrowserView);
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 1.5,
                      shadowColor: Colors.grey,
                      backgroundColor: Colors.white,
                      foregroundColor: const Color.fromRGBO(12, 53, 106, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(5),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.content_paste_search_rounded, size: 80.0),
                        Text(
                          'Check if you’re \ninvolved in data \nbreaches',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'RusticPrinted',
                            height: 0.8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
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
                    LearnResources(),
                    Icons.library_books_outlined,
                    'Learning \nResources',
                  ),
                ],
              ),
            ),
            // Mid buttons
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
              // ensures na di didikit yung button sa screen
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
                        'Tap here to report a dangerous website or software \nto the National Privacy Commission (NPC).',
                    titleFontSize: 16.0,
                    subFontSize: 11.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MidButton(
                      urlLink:
                          'https://transparencyreport.google.com/safe-browsing/search',
                      fg: Colors.white,
                      bg: Color(0xFF0174BE),
                      icon: Icons.check_circle_outline,
                      titleText: "Verify an unknown link",
                      subText:
                          'Unsure whether or not a link is safe? \nVerify it using Google Safe Browsing.',
                      titleFontSize: 17.0,
                      subFontSize: 12.0),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              // Bottom 2 containers
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomContainer(
                    titleText: "You might \nbe  a \nDangerous \nwebsite.",
                    icon: Icons.ring_volume_outlined,
                    subText:
                        "Our service keeps track and records reported website/application that are deemed a threat to data privacy.",
                    page: DangerSites(),
                    buttonText: "Check Here",
                    buttonIcon: Icons.play_circle_outline_outlined,
                  ),
                  CustomContainer(
                    titleText: "\nSomething's\nPhishy...\n",
                    icon: Icons.phishing,
                    subText:
                        "Learn how to discern legit websites from phishing scams. Challenge Bobby Phisher and break past his deceptive tricks to win!",
                    page: Phishy(),
                    buttonText: "Play Now",
                    buttonIcon: Icons.play_circle_outline_outlined,
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

// ----------------------------------------------------------------------------------------------------------------------------

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
        mainAxisAlignment: MainAxisAlignment.start,
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
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FF),
      appBar: const CustomBarApp(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                color: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'Password Managers',
                        style: TextStyle(
                          fontFamily: 'IntroRust',
                          fontSize: 19,
                          color: Color.fromRGBO(12, 53, 106, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomExpansionTile(
                      browserIcon: 'images/bitwarden_icon.png',
                      browserName: 'BitWarden',
                      listTitle: 'Things to consider:',
                      listSubTitle:
                          "\u2022 Free cross platform compatibility\n\u2022 End-to-end encryption and zero-knowledge architecture\n\u2022 Free and open-source version\n\u2022 Paid plans with additional features\n\u2022 Lacks emergency access feature",
                      browserLink: 'https://bitwarden.com/',
                      initialState: true,
                    ),
                    CustomExpansionTile(
                      browserIcon: 'images/dashlane_icon.png',
                      browserName: 'Dashlane',
                      listTitle: 'Things to consider:',
                      listSubTitle:
                          "\u2022 Proactive monitoring and remediation\n\u2022 Uses robust encryption algorithms (AES-256 bit)\n\u2022 VPN integration (premium) \n\u2022 Severely limited free version\n",
                      browserLink: 'https://www.dashlane.com/',
                      initialState: false,
                    ),
                    CustomExpansionTile(
                      browserIcon: 'images/lastpass_icon.png',
                      browserName: 'LastPass',
                      listTitle: 'Things to consider:',
                      listSubTitle:
                          "\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n",
                      browserLink: 'https://www.lastpass.com/',
                      initialState: false,
                    ),
                    CustomExpansionTile(
                      browserIcon: 'images/nordpass_icon.png',
                      browserName: 'NordPass',
                      listTitle: 'Things to consider:',
                      listSubTitle:
                          "\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n",
                      browserLink: 'https://nordpass.com/',
                      initialState: false,
                    ),
                    CustomExpansionTile(
                      browserIcon: 'images/1pass_icon.png',
                      browserName: '1Password',
                      listTitle: 'Things to consider:',
                      listSubTitle:
                          "\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n",
                      browserLink: 'https://1password.com/',
                      initialState: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Web Browser Page
class SecureWebs extends StatefulWidget {
  const SecureWebs({super.key});

  @override
  State<SecureWebs> createState() => _SecureWebsState();
}

class _SecureWebsState extends State<SecureWebs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FF),
      appBar: const CustomBarApp(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                color: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'Secure Web Browsers',
                        style: TextStyle(
                          fontFamily: 'IntroRust',
                          fontSize: 19,
                          color: Color.fromRGBO(12, 53, 106, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomExpansionTile(
                      browserIcon: 'images/google_icon.png',
                      browserName: 'Google Chrome',
                      listTitle: 'Why choose Google Chrome?',
                      listSubTitle:
                          "\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n",
                      browserLink:
                          'https://support.google.com/chrome/answer/95346?hl=en&co=GENIE.Platform%3DDesktop&oco=1#',
                      initialState: true,
                    ),
                    CustomExpansionTile(
                      browserIcon: 'images/micro_icon.png',
                      browserName: 'Microsoft Edge',
                      listTitle: 'Why choose Microsoft Edge?',
                      listSubTitle:
                          "\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n",
                      browserLink:
                          'https://www.microsoft.com/en-us/edge/download?form=MA13FJ&ch=1',
                      initialState: false,
                    ),
                    CustomExpansionTile(
                      browserIcon: 'images/firefox_icon.png',
                      browserName: 'Mozilla Firefox',
                      listTitle: 'Why choose Mozilla Firefox?',
                      listSubTitle:
                          "\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n",
                      browserLink: 'https://www.mozilla.org/en-US/firefox/new/',
                      initialState: false,
                    ),
                    CustomExpansionTile(
                      browserIcon: 'images/opera_icon.png',
                      browserName: 'Opera',
                      listTitle: 'Why choose Opera?',
                      listSubTitle:
                          "\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n",
                      browserLink: 'https://www.opera.com/download',
                      initialState: false,
                    ),
                    CustomExpansionTile(
                      browserIcon: 'images/brave_icon.png',
                      browserName: 'Brave',
                      listTitle: 'Why choose Brave?',
                      listSubTitle:
                          "\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n\u2022 Amongus\n",
                      browserLink: 'https://brave.com/download/',
                      initialState: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Learning Resource Page
class LearnResources extends StatefulWidget {
  const LearnResources({super.key});

  @override
  State<LearnResources> createState() => _LearnResourcesState();
}

class _LearnResourcesState extends State<LearnResources> {
  final videoURL = 'https://www.youtube.com/watch?v=49t-WWTx0RQ';
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FF),
      appBar: const CustomBarApp(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                color: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'Learning Resources',
                        style: TextStyle(
                          fontFamily: 'IntroRust',
                          fontSize: 19,
                          color: Color.fromRGBO(12, 53, 106, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Theme(
                      data: ThemeData(
                        dividerColor: Colors.transparent,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Center(
                          child: YoutubePlayer(
                            controller: _controller,
                            showVideoProgressIndicator: true,
                            onReady: () => debugPrint('Ready'),
                            bottomActions: [
                              CurrentPosition(),
                              ProgressBar(
                                isExpanded: true,
                                colors: const ProgressBarColors(
                                  playedColor: Colors.red,
                                  handleColor: Colors.blue,
                                ),
                              ),
                              const PlaybackSpeedButton()
                            ],
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
      ),
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

class TilePage extends StatefulWidget {
  const TilePage({super.key});

  @override
  State<TilePage> createState() => _TilePageState();
}

class _TilePageState extends State<TilePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// Custom widget for Gridview ElevatedButton
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

// Custom widget for the two buttons at the middle
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

class CustomContainer extends StatelessWidget {
  final String titleText;
  final IconData icon;
  final String subText;
  final Widget page;
  final String buttonText;
  final IconData buttonIcon;

  const CustomContainer({
    super.key,
    required this.titleText,
    required this.icon,
    required this.subText,
    required this.page,
    required this.buttonText,
    required this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.47,
      height: 225,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(
              12, 53, 106, 1), // Border color for the first container
          width: 2.0, // Border width for the first container
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                titleText,
                style: const TextStyle(
                  fontFamily: 'IntroRust',
                  fontSize: 16,
                  color: Color.fromRGBO(12, 53, 106, 1),
                ),
              ),
              Expanded(
                child: Icon(
                  icon,
                  size: 50,
                  color: const Color.fromRGBO(12, 53, 106, 1),
                ),
              ),
            ],
          ),
          Text(
            subText,
            style: const TextStyle(
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
                  builder: (BuildContext builder) => page,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(12, 53, 106, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.all(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: const TextStyle(
                    fontFamily: 'IntroRust',
                    color: Colors.white,
                  ),
                ),
                Icon(
                  buttonIcon,
                  size: 25,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final bool initialState;
  final String browserIcon;
  final String browserName;
  final String listTitle;
  final String listSubTitle;
  final String browserLink;

  const CustomExpansionTile(
      {super.key,
      required this.browserIcon,
      required this.browserName,
      required this.listTitle,
      required this.listSubTitle,
      required this.browserLink,
      required this.initialState});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: widget.initialState,
          iconColor: const Color.fromRGBO(12, 53, 106, 1),
          collapsedIconColor: const Color.fromRGBO(12, 53, 106, 1),
          title: Row(
            children: [
              SizedBox(
                height: 50,
                child: Image.asset(widget.browserIcon),
              ),
              Text(
                widget.browserName,
                style: const TextStyle(
                  fontFamily: "RusticPrinted",
                  fontSize: 20,
                  color: Color.fromRGBO(12, 53, 106, 1),
                ),
              ),
            ],
          ),
          children: <Widget>[
            ListTile(
              dense: true,
              title: Text(
                widget.listTitle,
                style: const TextStyle(
                  fontFamily: "IntroRust",
                  color: Color.fromRGBO(12, 53, 106, 1),
                ),
              ),
              subtitle: Text(
                widget.listSubTitle,
                style: const TextStyle(
                  fontFamily: "RusticPrinted",
                  color: Color.fromRGBO(12, 53, 106, 1),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  launchUrl(Uri.parse(widget.browserLink),
                      mode: LaunchMode.inAppBrowserView);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(12, 53, 106, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.6, 0),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Try Now!",
                        style: TextStyle(
                          fontFamily: "IntroRust",
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.link_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
