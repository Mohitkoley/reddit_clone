import 'dart:async';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reddit_clone/constants/colors.dart';
import 'package:reddit_clone/controllers/controller.dart';
import 'package:reddit_clone/widgets/circular_progress_indicator.dart';
import 'package:reddit_clone/widgets/custom_appbar.dart';

import '../constants/links.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  final PostDataController _postDataController = Get.find();

  void getPostsDataFromAPI() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2), () {
      _postDataController.getDataFromAPI();
    });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsDataFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? progressIndicator()
        : DefaultTabController(
            initialIndex: 1,
            length: 4,
            child: Scaffold(
              appBar: const CustomAppBar(),
              body: Obx(
                (() => SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.70,
                              child: ListView.builder(
                                itemCount:
                                    _postDataController.postsModel.length,
                                itemBuilder: (context, i) => SizedBox(
                                  height: Get.height * 0.22,
                                  child: Card(
                                    elevation: 2,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    child: _postDataController
                                                                .postsModel[i]
                                                                .data!
                                                                .children![i]
                                                                .data!
                                                                .thumbnail ==
                                                            'self'
                                                        ? Image.network(
                                                            url,
                                                            fit: BoxFit.cover,
                                                          )
                                                        : Image.network(
                                                            _postDataController
                                                                .postsModel[i]
                                                                .data!
                                                                .children![i]
                                                                .data!
                                                                .thumbnail!),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                      ' /r${_postDataController.postsModel[i].data!.children![i].data!.subreddit!}'),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Chip(
                                                  labelPadding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                  ),
                                                  label: const Text(
                                                    'Join',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                  backgroundColor: blue,
                                                ),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                      Icons.more_horiz),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            _postDataController
                                                .postsModel[i]
                                                .data!
                                                .children![i]
                                                .data!
                                                .title!,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        _postDataController
                                                .postsModel[i]
                                                .data!
                                                .children![i]
                                                .data!
                                                .allAwardings!
                                                .isEmpty

                                            // the validation here because in the api there is just one description field is filled others is empty. So I filled them with below text..
                                            ? const Text(
                                                '"When you come across a feel-good thing."')
                                            : Text(
                                                _postDataController
                                                    .postsModel[i]
                                                    .data!
                                                    .children![i]
                                                    .data!
                                                    .allAwardings![0]
                                                    .description!,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Icon(Icons.arrow_upward),
                                            const Text('Vote'),
                                            const Icon(Icons.arrow_downward),
                                            const Icon(Icons.chat_bubble),
                                            Text(_postDataController
                                                .postsModel[i]
                                                .data!
                                                .children![i]
                                                .data!
                                                .numComments
                                                .toString()),
                                            const Icon(Icons.share),
                                            const Text('Share'),
                                            const Icon(Icons.redeem),
                                            const Text('Award'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              bottomNavigationBar: BottomNavigationBar(
                fixedColor: primaryColor,
                unselectedItemColor: black,
                items: <BottomNavigationBarItem>[
                  const BottomNavigationBarItem(
                    label: '',
                    icon: Icon(Icons.home),
                  ),
                  const BottomNavigationBarItem(
                    label: '',
                    icon: Icon(Icons.explore),
                  ),
                  const BottomNavigationBarItem(
                    label: '',
                    icon: Icon(Icons.add),
                  ),
                  const BottomNavigationBarItem(
                    label: '',
                    icon: Icon(Icons.sms),
                  ),
                  BottomNavigationBarItem(
                      label: '',
                      icon: Badge(
                        badgeContent: const Text('1'),
                        child: const Icon(Icons.notifications),
                      ))
                ],
              ),
            ),
          );
  }
}
