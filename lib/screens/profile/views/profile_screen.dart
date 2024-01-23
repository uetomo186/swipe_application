import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:swipe_application/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:swipe_application/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:swipe_application/screens/profile/views/add_photo_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> newPhotos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(context.read<AuthenticationBloc>().state.user!.pictures.length);
        },
        child: const Icon(
          CupertinoIcons.check_mark,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(const SignOutRequired());
              },
              icon: const Icon(Icons.login))
        ],
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Photos',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 9 / 16),
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () async {
                            context
                                .read<AuthenticationBloc>()
                                .state
                                .user!
                                .pictures;
                            if (!(newPhotos.isNotEmpty &&
                                (i < newPhotos.length))) {
                              var photos = await pushNewScreen(context,
                                  screen: const AddPhotoScreen());

                              if (photos != null) {
                                setState(() {
                                  context
                                      .read<AuthenticationBloc>()
                                      .state
                                      .user!
                                      .pictures
                                      .addAll(photos);
                                });
                              }
                            }
                          },
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: context
                                            .read<AuthenticationBloc>()
                                            .state
                                            .user!
                                            .pictures
                                            .isNotEmpty &&
                                        (i <
                                            context
                                                .read<AuthenticationBloc>()
                                                .state
                                                .user!
                                                .pictures
                                                .length)
                                    ? Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(
                                              File(newPhotos[i]),
                                            ),
                                          ),
                                        ),
                                      )
                                    : DottedBorder(
                                        color: Colors.grey.shade700,
                                        borderType: BorderType.RRect,
                                        radius: const Radius.circular(10),
                                        dashPattern: [6, 6, 6, 6],
                                        padding: EdgeInsets.zero,
                                        strokeWidth: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Material(
                                  elevation: 4,
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: Center(
                                      child: newPhotos.isNotEmpty &&
                                              (i < newPhotos.length)
                                          ? GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  context
                                                      .read<
                                                          AuthenticationBloc>()
                                                      .state
                                                      .user!
                                                      .pictures
                                                      .remove(context
                                                          .read<
                                                              AuthenticationBloc>()
                                                          .state
                                                          .user!
                                                          .pictures[i]);
                                                });
                                              },
                                              child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Image.asset(
                                                      'assets/icons/clear.png',
                                                      color: Colors.grey,
                                                    ),
                                                  )),
                                            )
                                          : Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Image.asset(
                                                  'assets/icons/add.png',
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'About me',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                child: TextFormField(
                  maxLines: 10,
                  minLines: 1,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    hintText: "about me",
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
