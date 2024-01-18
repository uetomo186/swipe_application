import 'package:flutter/cupertino.dart';

class OtherProfileDetailsScreen extends StatefulWidget {
  final int index;
  const OtherProfileDetailsScreen(this.index, {super.key});

  @override
  State<OtherProfileDetailsScreen> createState() =>
      _OtherProfileDetailsScreenState();
}

class _OtherProfileDetailsScreenState extends State<OtherProfileDetailsScreen> {
  int numberPhoto = 4;
  int currentPhoto = 0;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
