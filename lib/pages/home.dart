import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:installed_apps/app_info.dart';
import '../api/api_conection.dart';
import '../models/api_response_model.dart';
import '../pages/share.dart';
import 'package:remixicon/remixicon.dart';
import 'package:intl/intl.dart';
import '../widgets/custom_iconbutton.dart';
import 'package:installed_apps/installed_apps.dart';

import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  API api = API();
  String slug = "daraz-recruiting-for-17-different-positions";
  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final thm = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Blogs',
              style: TextStyle(
                  fontFamily: 'Noto Sans SemiBold',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            leading: const Icon(Remix.arrow_left_s_line),
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0.0),
        body: FutureBuilder(
            future: api.getPost(slug),
            builder:
                ((BuildContext ctx, AsyncSnapshot<APIResponseModel?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 16.0),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data!.category,
                                    style: TextStyle(
                                      fontFamily: 'Noto Sans Regular',
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Icon(
                                      Remix.checkbox_blank_circle_fill,
                                      color: Colors.grey[600],
                                      size: 2.0,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('MMM d, yyyy')
                                        .format(snapshot.data!.createdAt),
                                    style: TextStyle(
                                      fontFamily: 'Noto Sans Regular',
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  snapshot.data!.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'Noto Sans SemiBold',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyIconButton(
                                      position: 'top',
                                      onPressed: () {
                                        _launchInWebViewOrVC(Uri.parse(
                                            'https://www.facebook.com/merojob/'));
                                      },
                                      icon: Remix.facebook_circle_fill),
                                  MyIconButton(
                                      position: 'top',
                                      onPressed: () {
                                        _launchInWebViewOrVC(Uri.parse(
                                            'https://twitter.com/merojob'));
                                      },
                                      icon: Remix.twitter_fill),
                                  MyIconButton(
                                      position: 'top',
                                      onPressed: () {},
                                      icon: Remix.whatsapp_fill),
                                  MyIconButton(
                                      position: 'top',
                                      onPressed: () {},
                                      icon: Remix.mail_fill),
                                  MyIconButton(
                                      position: 'top',
                                      onPressed: () {
                                        context.go('/details/1');
                                        // showModalBottomSheet<void>(
                                        //   context: context,
                                        //   builder: (BuildContext context) {
                                        //     return ClipRRect(
                                        //         borderRadius:
                                        //             BorderRadius.circular(30.0),
                                        //         child: const SharePage());
                                        //   },
                                        // );
                                      },
                                      icon: Remix.share_line),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Icon(
                                      Remix.checkbox_blank_circle_fill,
                                      color: Colors.grey[600],
                                      size: 2.0,
                                    ),
                                  ),
                                  Text(
                                    'Total Views: ${snapshot.data!.count}',
                                    style: TextStyle(
                                      fontFamily: 'Noto Sans Regular',
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Image.network(
                                  snapshot.data!.headerImg,
                                  height: 214.0,
                                  width: 428.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                "\"${snapshot.data!.excerpt}\"",
                                textAlign: TextAlign.justify,
                                // style: const TextStyle(
                                //   fontFamily: 'Noto Sans SemiBold',
                                //   fontSize: 16.0,
                                //   fontWeight: FontWeight.w600,
                                //   color: Colors.black,
                                // ),
                                style: thm.textTheme.bodyLarge!
                                    .copyWith(color: thm.primaryColor),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Divider(
                                  color: Colors.grey[200],
                                ),
                              ),
                            ]),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16.0),
                            child: Html(
                              style: {
                                "p": Style(
                                  textAlign: TextAlign.justify,
                                  fontFamily: 'Noto Sans Regular',
                                  fontWeight: FontWeight.w400,
                                  fontSize: FontSize(16.0),
                                ),
                                "strong": Style(
                                  textAlign: TextAlign.justify,
                                  fontFamily: 'Noto Sans SemiBold',
                                ),
                                'a': Style(
                                  color: Colors.blue[900],
                                  textDecoration: TextDecoration.none,
                                ),
                              },
                              data: snapshot.data!.body,
                              onLinkTap: (
                                url,
                                _,
                                __,
                              ) {
                                _launchInWebViewOrVC(Uri.parse(url!));
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                color: (Colors.grey[200])!,
                              ),
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tags',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'Noto Sans SemiBold',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  height: 20.0,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: snapshot.data!.tags.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 4.0),
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                        0, 92, 204, 1)
                                                    .withOpacity(0.7),
                                                borderRadius:
                                                    BorderRadius.circular(4.0)),
                                            child: Text(
                                              snapshot.data!.tags[index],
                                              style: const TextStyle(
                                                  fontFamily:
                                                      'Noto Sans Regular',
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(
                              color: (Colors.grey[200])!,
                            ))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Share article',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'Noto Sans SemiBold',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        MyIconButton(
                                            position: 'bottom',
                                            onPressed: () {
                                              _launchInWebViewOrVC(Uri.parse(
                                                  'https://www.facebook.com/merojob/'));
                                            },
                                            icon: Remix.facebook_circle_fill),
                                        MyIconButton(
                                            position: 'bottom',
                                            onPressed: () {
                                              _launchInWebViewOrVC(Uri.parse(
                                                  'https://twitter.com/merojob'));
                                            },
                                            icon: Remix.twitter_fill),
                                        MyIconButton(
                                            position: 'bottom',
                                            onPressed: () {},
                                            icon: Remix.whatsapp_fill),
                                        MyIconButton(
                                            position: 'bottom',
                                            onPressed: () {},
                                            icon: Remix.mail_fill),
                                        MyIconButton(
                                            position: 'bottom',
                                            onPressed: () {},
                                            icon: Remix.share_line),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 6.0),
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                0, 92, 204, 1),
                                            borderRadius:
                                                BorderRadius.circular(4.0)),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Remix.thumb_up_fill,
                                              size: 16.0,
                                              color: Colors.white,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 9.0),
                                              child: Text(
                                                'Like',
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Noto Sans Regular',
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Text(
                                              '8',
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Noto Sans Regular',
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Latest News',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: 'Noto Sans SemiBold',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  SizedBox(
                                    width: double.maxFinite,
                                    height: 335.0,
                                    child: ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16.0),
                                              child: Divider(
                                                color: Colors.grey[100],
                                              ),
                                            ),
                                        shrinkWrap: true,
                                        physics: const ClampingScrollPhysics(),
                                        itemCount: 3,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            children: [
                                              Container(
                                                height: 80.0,
                                                width: 160.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    image:
                                                        const DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                              'http://192.168.99.20/media/header_img/9df13263-a450-4de7-8a7f-3db1756159d0.jpg',
                                                            ))),
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'CAREER BLOGS',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Noto Sans Regular',
                                                            color: Colors
                                                                .grey[600],
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: Icon(
                                                            Remix
                                                                .checkbox_blank_circle_fill,
                                                            color: Colors
                                                                .grey[600],
                                                            size: 2.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Jan 30, 2023',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Noto Sans Regular',
                                                            color: Colors
                                                                .grey[600],
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Text(
                                                      'Capacity Building Trainings to help you take your career to',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Noto Sans SemiBold',
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('error');
                }
              }
              return Text('abcd');
            })));
  }
}
