import 'package:flutter/material.dart';
import 'package:social_downloader_app_ui/pages/social_app_page.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> socialAppList = [
    {
      "image": "assets/images/instagram.png",
      "name": "Instagram",
      "totalDownload": 120,
    },
    {
      "image": "assets/images/tittok.png",
      "name": "TitTok",
      "totalDownload": 36,
    },
    {
      "image": "assets/images/twitter.png",
      "name": "Twitter",
      "totalDownload": 12,
    },
    {
      "image": "assets/images/facebook.png",
      "name": "Facebook",
      "totalDownload": 331,
    },
    {
      "image": "assets/images/youtube.png",
      "name": "Youtube",
      "totalDownload": 100,
    },
    {
      "image": "assets/images/snapchat.png",
      "name": "Snapchat",
      "totalDownload": 334,
    },
  ];
  late String socialApp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              MyAppBar(),
              HomeScreenView(
                () => _navigateToSocialAppPage(context),
                socialAppList: socialAppList,
                socialAppName: (socialAppName) {
                  socialApp = socialAppName;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _navigateToSocialAppPage(BuildContext context) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SocialAppPage(
            titleName: socialApp,
          ),
        ),
      );
}

class HomeScreenView extends StatefulWidget {
  const HomeScreenView(this.onTapApp,
      {Key? key, required this.socialAppList, required this.socialAppName})
      : super(key: key);
  final List<Map<String, dynamic>> socialAppList;
  final Function onTapApp;
  final Function(String) socialAppName;

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_LARGE),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
              mainAxisSpacing: MARGIN_MEDIUM_1X,
              crossAxisSpacing: MARGIN_MEDIUM_1X),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.socialAppList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.onTapApp();
                  widget.socialAppName(
                      widget.socialAppList.elementAt(index)['name']);
                });
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    MARGIN_MEDIUM_2X,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    MARGIN_MEDIUM_SMALL,
                  ),
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(MARGIN_MEDIUM_1XX),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            widget.socialAppList.elementAt(index)['image'],
                            width: MARGIN_MEDIUM_XLARGE_1X,
                            height: MARGIN_MEDIUM_XLARGE_1X,
                          ),
                        ),
                      ),
                      const SizedBox(height: MARGIN_MEDIUM_1XX),
                      Text(
                        widget.socialAppList.elementAt(index)['name'],
                        style: const TextStyle(
                          fontSize: TEXT_REGULAR_2X,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: MARGIN_LARGE),
                      const Text(
                        "Total Download",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: TEXT_REGULAR,
                          color: APP_BAR_CIRCLE_COLOR,
                        ),
                      ),
                      const SizedBox(height: MARGIN_MEDIUM),
                      Text(
                        widget.socialAppList
                            .elementAt(index)['totalDownload']
                            .toString(),
                        style: const TextStyle(
                          fontSize: TEXT_REGULAR,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class MyAppBar extends StatelessWidget {
  //const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_LARGE),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MenuView(),
          TitleView(),
          NotificationView(),
        ],
      ),
    );
  }
}

class NotificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          splashRadius: MARGIN_MEDIUM_2X,
          icon: const Icon(
            Icons.notifications_outlined,
            size: MARGIN_MEDIUM_XLARGE,
          ),
          onPressed: () {},
        ),
        Positioned(
          top: MARGIN_SMALL_2X,
          right: MARGIN_MEDIUM,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: const Padding(
                padding: EdgeInsets.all(MARGIN_SMALL),
                child: Text(
                  "2",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: TEXT_SMALL),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class TitleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: TITLE_TEXT_CONTAINER_WIDTH,
          height: MARGIN_MEDIUM_1X,
          decoration: const BoxDecoration(color: Colors.amber),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
          child: Text(
            TITLE_TEXT,
            style: TextStyle(
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w500,
              color: APP_BAR_CIRCLE_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MARGIN_LARGE,
      height: MARGIN_LARGE,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: APP_BAR_CIRCLE_COLOR),
      child: const Icon(
        Icons.menu,
        size: MARGIN_MEDIUM_LARGE,
        color: Colors.white,
      ),
    );
  }
}
