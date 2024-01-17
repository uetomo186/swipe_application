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
    );
  }
}
