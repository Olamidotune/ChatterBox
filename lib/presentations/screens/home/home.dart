import 'package:chatterbox/config/colors.dart';
import 'package:chatterbox/config/text_styles.dart';
import 'package:chatterbox/presentations/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: BLACK,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "ChatterBox",
            style: heading().copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: THEME.withOpacity(0.2)),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: THEME_2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                        ChatScreen.routeName,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 30,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Olamidotun",
                                  style: smallHeading()
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  "Hello, good afternoon how is your day going?",
                                  style: normalText()
                                      .copyWith(color: Colors.white70),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "1:50 pm",
                          style: normalText().copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 30,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Olamidotun",
                                style: smallHeading()
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                "Hello, good afternoon how is your day going?",
                                style: normalText()
                                    .copyWith(color: Colors.white70),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "1:50 pm",
                        style: normalText().copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
