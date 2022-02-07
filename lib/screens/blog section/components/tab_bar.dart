import 'package:eduance/widgets/comman/progressiveimage.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
//Constants
import '../../../utils/constants/colors.dart';

//Widgets
import '../../../widgets/comman/textwidget.dart';

ColorPallete colorPallete = ColorPallete();

Widget getBlogsByCategories(BuildContext context) {
  return FutureBuilder(builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.none &&
        snapshot.hasData == null) {
      return Container();
    }
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'blog_read');
          },
          child: ListTile(
            title:
                textWidget("Hello Guys Welcom To TV", colorPallete.bgColor, 14),

            subtitle: textWidget(
                "Akshay Saxena| June 2022", colorPallete.secondaryText, 5,
                fontWeight: FontWeight.normal),
            trailing: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: ClipRRect(
                  borderRadius:BorderRadius.circular(20),
                  child: progressiveImageWidget(
                      context, "https://picsum.photos/id/10/200/300", 80, 80)),
            ),
          ),
        );
      },
    );
  });
}

Widget tabSection(BuildContext context) {
  return DefaultTabController(
    length: 6,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              // labelColor: Colors.black,
              unselectedLabelColor: colorPallete.bgColor,
              indicator: BubbleTabIndicator(
                indicatorHeight: 35.0,
                indicatorColor: colorPallete.bgColor,
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
              ),
              tabs: [
                Tab(
                  text: "Programming",
                ),
                Tab(text: "Science"),
                Tab(text: "History"),
                Tab(text: "Maths"),
                Tab(text: "GK"),
                Tab(text: "Others"),
              ]),
        ),
        Container(
          //Add this to give height
          height: 300,
          child: TabBarView(children: [
            Container(
              child: getBlogsByCategories(context),
            ),
            Container(
              child: getBlogsByCategories(context),
            ),
            Container(
              child: getBlogsByCategories(context),
            ),
            Container(
              child: getBlogsByCategories(context),
            ),
            Container(
              child: getBlogsByCategories(context),
            ),
            Container(
              child: getBlogsByCategories(context),
            ),
          ]),
        ),
      ],
    ),
  );
}
