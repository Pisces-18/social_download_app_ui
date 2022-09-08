import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class SocialAppPage extends StatelessWidget {
  const SocialAppPage({Key? key, required this.titleName}) : super(key: key);
  final String titleName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: MARGIN_MEDIUM_1X,
          ),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: APP_BAR_CIRCLE_COLOR,
            ),
          ),
        ),
        title: Text(
          titleName,
          style: const TextStyle(
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w500,
            color: APP_BAR_CIRCLE_COLOR,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: MARGIN_MEDIUM_LARGE,
            ),
            child: Image.asset(
              "assets/images/share.png",
              width: MARGIN_MEDIUM_LARGE,
              height: MARGIN_MEDIUM_LARGE,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_LARGE, vertical: MARGIN_MEDIUM_1XX),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext conext, int index) {
              return Card(
                child: Text("1"),
              );
            }),
      ),
      bottomNavigationBar: Card(
        elevation: 3,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MARGIN_MEDIUM_XLARGE_1X),
          topRight: Radius.circular(MARGIN_MEDIUM_XLARGE_1X),
        ),),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
          height: BOTTOM_NAVIGATION_BAR_HEIGHT,
          width: double.infinity,
          child: Row(
            children: [
              Image.asset(
                "assets/images/video-player.png",
                width: MARGIN_MEDIUM_XLARGE,
                height: MARGIN_MEDIUM_XLARGE,
                color: Colors.amber,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2X),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const LinearProgressIndicator(
                        value: 0.4,
                        backgroundColor: LINEAR_PREGRESS_INDICATOR_BACKGROUND_COLOR,
                        valueColor: AlwaysStoppedAnimation(BUTTON_BACKGROUND_COLOR),
                      ),
                      const SizedBox(height: MARGIN_MEDIUM_1X),
                      Row(
                        children: const [
                          Text("8.9MB",style: TextStyle(color: BUTTON_BACKGROUND_COLOR),),
                          Spacer(),
                          Text("4.6MB/8.9MB",style: TextStyle(color: Colors.grey),),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                height: MARGIN_LARGE_1X,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MARGIN_LARGE_1X),
                      ),
                      primary: BUTTON_BACKGROUND_COLOR,
                    ),
                    child: const Text(
                      "Private Folder",
                      style: TextStyle(
                        fontSize: TEXT_REGULAR,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
