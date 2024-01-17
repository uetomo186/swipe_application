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
  int currentPage = 0;
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
              "Tinder",
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
                              image: AssetImage("assets/girl.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
