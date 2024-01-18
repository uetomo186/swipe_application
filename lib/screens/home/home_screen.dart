import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipe_application/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController(initialPage: 0);

  int numberPhotos = 4;
  int currentPhoto = 0;
  late MatchEngine _matchEngine;

  List<SwipeItem> items = [
    SwipeItem(
        content: "Liz",
        likeAction: () {
          log("Liked");
        },
        nopeAction: () {
          log("Nope");
        },
        superlikeAction: () {
          log("Super Liked");
        },
        onSlideUpdate: (SlideRegion? region) async {
          log("Region $region");
        }),
    SwipeItem(
        content: "Liz",
        likeAction: () {
          log("Liked");
        },
        nopeAction: () {
          log("Nope");
        },
        superlikeAction: () {
          log("Super Liked");
        },
        onSlideUpdate: (SlideRegion? region) async {
          log("Region $region");
        }),
    SwipeItem(
        content: "Liz",
        likeAction: () {
          log("Liked");
        },
        nopeAction: () {
          log("Nope");
        },
        superlikeAction: () {
          log("Super Liked");
        },
        onSlideUpdate: (SlideRegion? region) async {
          log("Region $region");
        }),
  ];

  @override
  void initState() {
    _matchEngine = MatchEngine(swipeItems: items);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/tinder_logo.png",
              scale: 18,
            ),
            Text(
              "Swiper",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
      body: SwipeCards(
          matchEngine: _matchEngine,
          onStackFinished: () {},
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Hero(
                    tag: "imageTage$i",
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage("assets/girl.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Colors.black, Colors.transparent])),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  if (currentPhoto != 0) {
                                    setState(() {
                                      currentPhoto = currentPhoto - 1;
                                    });
                                  }
                                },
                                child: Container(color: Colors.red),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  if (currentPhoto != 0) {
                                    setState(() {
                                      currentPhoto = currentPhoto - 1;
                                    });
                                  }
                                },
                                child: Container(color: Colors.lightBlue),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 20,
                                  height: 6,
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, int i) {
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Container(
                                            width: ((MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    (20 +
                                                        ((numberPhotos + 1) *
                                                            8))) /
                                                numberPhotos),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 0.5),
                                            ),
                                            color: currentPhoto == i
                                                ? Colors.white
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .secondary
                                                    .withOpacity(0.5)),
                                      );
                                    },
                                  ))),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        items[i].content,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "25",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          CupertinoIcons.ant_circle_fill,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {},
                                        splashColor: Colors.orange,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.orange,
                                            ),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Image.asset(
                                                "assets/icons/back.png",
                                                color: Colors.yellow,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
