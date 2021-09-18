import 'package:flutter/material.dart';

import 'package:instagram_redesign_clone/colors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Redesign Instagram",
    home: HomeScreen(),
  ));
}

class HomeScreenMenu {
  String name;
  bool isSelected;

  HomeScreenMenu(this.name, this.isSelected);
}

class Feeds {
  String avatar;
  String user_Name;
  String location;
  String comment;
  String post_Time;
  String image;
  int like_Count;
  int comment_Count;
  Feeds({
    required this.avatar,
    required this.user_Name,
    required this.location,
    required this.comment,
    required this.post_Time,
    required this.image,
    required this.like_Count,
    required this.comment_Count,
  });
}

class Menu {
  String? icon;
  bool? isSelected;
  Menu({this.icon, this.isSelected});
}

class Birthdays {
  bool isFemale;
  String avatar;
  String name;
  String age;
  Birthdays(
      {required this.isFemale,
      required this.age,
      required this.name,
      required this.avatar});
}

class Stories {
  String image;
  String avatar;
  String name;
  String post_Time;

  Stories(
      {required this.avatar,
      required this.image,
      required this.name,
      required this.post_Time});
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectedIndex = 0;
  int currentPageIndex = 0;
  List<HomeScreenMenu> myList = [
    new HomeScreenMenu("Feed", true),
    new HomeScreenMenu("Stories", false),
    new HomeScreenMenu("IGTV", false),
    new HomeScreenMenu("Events", false),
  ];

  List<Menu> myMenu = [
    new Menu(icon: "assets/home.png", isSelected: true),
    new Menu(icon: "assets/search.png", isSelected: false),
    new Menu(icon: "assets/tab3.png", isSelected: false),
    new Menu(icon: "assets/avatar.png", isSelected: false),
  ];

  List<Feeds> myFeeds = [
    new Feeds(
        avatar: "assets/helen_miles.png",
        user_Name: "Helen Miles",
        location: "Toronto CA",
        comment:
            "Hi Guys , This block is comment bloc , I love so much this platform and area",
        post_Time: "3 hour ago",
        image: "assets/hm_1.png",
        like_Count: 23000,
        comment_Count: 187),
    new Feeds(
        avatar: "assets/john_legend.png",
        user_Name: "John Legend",
        location: "Toronto CA",
        comment: "Hi Guys , This block ",
        post_Time: "3 hour ago",
        image: "assets/hm_1.png",
        like_Count: 2324000,
        comment_Count: 184)
  ];

  List<Widget> myMenuWidget = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < myMenu.length; i++) {}
  }

  List<Birthdays> myBirthdays = [
    new Birthdays(
        isFemale: false,
        age: "28 years old",
        name: "Berk Aydın",
        avatar: "assets/brt_ali_yasini.png"),
    new Birthdays(
        isFemale: true,
        age: "23 years old",
        name: "Nilüfer Sandıkçı",
        avatar: "assets/Niloofar.png"),
    new Birthdays(
        isFemale: false,
        age: "34 years old",
        name: "Mehmet Uyanık",
        avatar: "assets/brt_ali_yasini.png"),
  ];

  List<Stories> myStories = [
    new Stories(
        avatar: "assets/str_aria_majidi.png",
        image: "assets/str1.png",
        name: "Emre Eroğlu",
        post_Time: "2 min ago"),
    new Stories(
        avatar: "assets/str_helen_miles.png",
        image: "assets/str2.png",
        name: "Merve Taş",
        post_Time: "14 min ago"),
    new Stories(
        avatar: "assets/str_someone.png",
        image: "assets/str3.png",
        name: "Ebrar Özen",
        post_Time: "20 min ago")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.0, left: 21.0, bottom: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 21.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/logo.png"),
                        Image.asset("assets/notf.png"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, int index) {
                          return Row(
                            children: [
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    myList[currentSelectedIndex].isSelected =
                                        false;
                                    currentSelectedIndex = index;
                                    myList[currentSelectedIndex].isSelected =
                                        true;
                                  });
                                },
                                child: Container(
                                  width: 56,
                                  height: 50,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          myList[index].name,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: myList[index].isSelected
                                                  ? redcolor
                                                  : Colors.black),
                                        ),
                                        myList[index].isSelected
                                            ? Column(
                                                children: [
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Container(
                                                    width: 8,
                                                    height: 8,
                                                    decoration: BoxDecoration(
                                                        color: redcolor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                  ),
                                                ],
                                              )
                                            : SizedBox()
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 80,
                              )
                            ],
                          );
                        },
                        itemCount: myList.length,
                        shrinkWrap: true,
                      )),
                  currentSelectedIndex == 0
                      ? Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, int index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(myFeeds[index].avatar),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                89 -
                                                21 -
                                                8,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(myFeeds[index].user_Name),
                                                Text(
                                                  myFeeds[index].location,
                                                  style: TextStyle(
                                                      color: greyColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(Icons.more_horiz),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    myFeeds[index].comment,
                                    style: TextStyle(fontSize: 17.5),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(myFeeds[index].post_Time,
                                      style: TextStyle(color: greyColor)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Image.asset(myFeeds[index].image),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 42,
                                        height: 42,
                                        child: Center(
                                          child: Image.asset(
                                            "assets/like.png",
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: redTransColor,
                                          borderRadius:
                                              BorderRadius.circular(21),
                                        ),
                                      ),
                                      Text(
                                        myFeeds[index].like_Count > 1000
                                            ? (myFeeds[index].like_Count / 1000)
                                                    .toString() +
                                                "K"
                                            : (myFeeds[index].like_Count)
                                                .toString(),
                                        style: TextStyle(color: redcolor),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        width: 42,
                                        height: 42,
                                        child: Center(
                                          child: Image.asset(
                                            "assets/comment.png",
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: redTransColor,
                                          borderRadius:
                                              BorderRadius.circular(21),
                                        ),
                                      ),
                                      Text(
                                        myFeeds[index].comment_Count > 1000
                                            ? (myFeeds[index].comment_Count /
                                                        1000)
                                                    .toString() +
                                                "K"
                                            : (myFeeds[index].comment_Count)
                                                .toString(),
                                        style: TextStyle(color: blueColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                ],
                              );
                            },
                            itemCount: myFeeds.length,
                            shrinkWrap: true,
                          ),
                        )
                      : currentSelectedIndex == 1
                          ? Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Today's Birthdays",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    SizedBox(height: 6),
                                    Container(
                                      height: 178,
                                      child: ListView.builder(
                                          itemCount: myBirthdays.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, int index) {
                                            return Row(
                                              children: [
                                                Container(
                                                  width: 160,
                                                  height: 178,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 11),
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                            myBirthdays[index]
                                                                .avatar),
                                                        SizedBox(height: 3),
                                                        Text(
                                                          myBirthdays[index]
                                                              .name,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(height: 3),
                                                        Text(myBirthdays[index]
                                                            .age),
                                                        SizedBox(height: 15),
                                                        Container(
                                                          width: 107,
                                                          height: 29,
                                                          child: Center(
                                                            child: Text(
                                                              "Wish" +
                                                                  (myBirthdays[
                                                                              index]
                                                                          .isFemale
                                                                      ? " Her"
                                                                      : " Him"),
                                                              style: TextStyle(
                                                                  color: myBirthdays[
                                                                              index]
                                                                          .isFemale
                                                                      ? redcolor
                                                                      : blueColor,
                                                                  fontSize: 16),
                                                            ),
                                                          ),
                                                          decoration: BoxDecoration(
                                                              color: myBirthdays[
                                                                          index]
                                                                      .isFemale
                                                                  ? redButtonColor
                                                                  : blueButtonColor),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                ),
                                                SizedBox(
                                                  width: 19,
                                                )
                                              ],
                                            );
                                          }),
                                    ),
                                    SizedBox(height: 18.0),
                                    Text(
                                      "New Stories",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    SizedBox(height: 7),
                                    Container(
                                      height: 208,
                                      child: ListView.builder(
                                          itemCount: myStories.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, int index) {
                                            return Row(
                                              children: [
                                                Container(
                                                  height: 208,
                                                  width: 150,
                                                  child: Stack(
                                                    children: [
                                                      Image.asset(
                                                        myStories[index].image,
                                                      ),
                                                      Image.asset(
                                                          "assets/bg.png"),
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 12,
                                                                  left: 10,
                                                                  right: 10),
                                                          child: Container(
                                                            height: 35,
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                    myStories[
                                                                            index]
                                                                        .avatar),
                                                                SizedBox(
                                                                    width: 5),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      myStories[
                                                                              index]
                                                                          .name,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    Text(
                                                                        myStories[index]
                                                                            .post_Time,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 11)),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                )
                                              ],
                                            );
                                          }),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width / 2) - 30,
                              height: 70,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        currentPageIndex = 0;
                                      });
                                    },
                                    child: MenuItem(context,
                                        icon: "assets/home.png",
                                        isSelected: currentPageIndex == 0
                                            ? true
                                            : false),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          currentPageIndex = 1;
                                        });
                                      },
                                      child: MenuItem(
                                        context,
                                        icon: "assets/search.png",
                                        isSelected: currentPageIndex == 1
                                            ? true
                                            : false,
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 58,
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width / 2) - 30,
                              height: 70,
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          currentPageIndex = 2;
                                        });
                                      },
                                      child: MenuItem(
                                        context,
                                        icon: "assets/tab3.png",
                                        isSelected: currentPageIndex == 2
                                            ? true
                                            : false,
                                      )),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          currentPageIndex = 3;
                                        });
                                      },
                                      child: MenuItem(
                                        context,
                                        icon: "assets/avatar.png",
                                        isSelected: currentPageIndex == 3
                                            ? true
                                            : false,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 61,
                        height: 61,
                        child: Center(child: Image.asset("assets/plus.png")),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27),
                            color: redcolor,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(-1, 6),
                                blurRadius: 10,
                                color: Color(0xFFF86B68).withOpacity(.36),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class MenuItem extends StatelessWidget {
  late BuildContext mycontext;
  String icon;
  bool isSelected;
  MenuItem(this.mycontext, {required this.icon, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ((MediaQuery.of(mycontext).size.width / 2) - 30) / 2,
      height: 70,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(icon),
            SizedBox(
              height: 5,
            ),
            isSelected
                ? Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(2),
                    ))
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
