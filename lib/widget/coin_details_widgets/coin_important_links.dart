import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:url_launcher/url_launcher.dart';

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onLoadStart(String url) async {
    print("\n\nStarted $url\n\n");
  }

  @override
  Future onLoadStop(String url) async {
    print("\n\nStopped $url\n\n");
  }

  @override
  void onLoadError(String url, int code, String message) {
    print("\n\nCan't load $url.. Error: $message\n\n");
  }

  @override
  void onExit() {
    print("\n\nBrowser closed!\n\n");
  }
}

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  MyChromeSafariBrowser(browserFallback) : super(bFallback: browserFallback);

  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}

class CoinImportantLinks extends StatefulWidget {
  final String youtube;
  final String website;
  final String explorer;
  final String facebook;
  final String blog;
  final String forum;
  final String github;
  final String raddit;
  final String slack;
  final String paper;

  CoinImportantLinks(
    this.youtube,
    this.website,
    this.explorer,
    this.facebook,
    this.blog,
    this.forum,
    this.github,
    this.raddit,
    this.slack,
    this.paper,
  );

  final ChromeSafariBrowser browser =
      new MyChromeSafariBrowser(new MyInAppBrowser());

  @override
  _CoinImportantLinksState createState() => _CoinImportantLinksState();
}

class _CoinImportantLinksState extends State<CoinImportantLinks> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
        id: 1,
        label: 'Custom item menu 1',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
          print(url);
          print(title);
        }));
    widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
        id: 2,
        label: 'Custom item menu 2',
        action: (url, title) {
          print('Custom item menu 2 clicked!');
          print(url);
          print(title);
        }));
    super.initState();
  }

  Widget build(BuildContext context) {
    List<dynamic> impLinks = [
      {
        'name': 'Website',
        'logo': 'assets/images/browser.png',
        'link': widget.website,
      },
      {
        'name': 'Explorer',
        'logo': 'assets/images/safari.png',
        'link': widget.explorer,
      },
      {
        'name': 'Facebook',
        'logo': 'assets/images/facebook.png',
        'link': widget.facebook,
      },
      {
        'name': 'Blog',
        'logo': 'assets/images/blogger.png',
        'link': widget.blog,
      },
      {
        'name': 'WhitePaper',
        'logo': 'assets/images/origami-white-page.png',
        'link': widget.paper,
      },
      {
        'name': 'Forum',
        'logo': 'assets/images/chat.png',
        'link': widget.forum,
      },
      {
        'name': 'Github',
        'logo': 'assets/images/github.png',
        'link': widget.github,
      },
      {
        'name': 'Reddit',
        'logo': 'assets/images/reddit.png',
        'link': widget.raddit,
      },
      {
        'name': 'Slack',
        'logo': 'assets/images/slack.png',
        'link': widget.slack,
      },
    ];

    // Future<void> _launchInWebView(String url) async {
    //   if (await canLaunch(url)) {
    //     await launch(
    //       url,
    //       forceSafariVC: true,
    //       forceWebView: true,
    //       enableJavaScript: true,
    //     );
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }

    return Container(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: impLinks.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              await widget.browser.open(
                  url: impLinks[index]['link'],
                  options: ChromeSafariBrowserClassOptions(
                      android: AndroidChromeCustomTabsOptions(
                          addDefaultShareMenuItem: false),
                      ios: IOSSafariOptions(barCollapsingEnabled: true)));
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('${impLinks[index]['logo']}'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  impLinks[index]['name'],
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
