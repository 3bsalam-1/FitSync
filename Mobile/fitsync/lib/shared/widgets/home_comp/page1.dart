
import 'package:fitsync/shared/widgets/home_comp/tips_tricks_widget.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          InkWell(
              onTap: () {},
              child: TipsAndTricksWidget(
                imageUrl: "assets/images/walking.jfif",
                label1: "Sport",
                label2: "How Fit Can You Get From Just\n",
                label3: "Walking?",
                label4:
                    "walking is good for you, obviously, But can\nit whip you into shape ",
                label5: "5 Min read",
              )),
          SizedBox(
            height: 30,
          ),
          InkWell(
              onTap: () {},
              child: TipsAndTricksWidget(
                imageUrl: "assets/images/tipsImages/food.jfif",
                label1: "healthy food",
                label2: "Confused by all the conflicting \n",
                label3: "nutrition advice",
                label4:
                    "these simple tips can show you how to plan\nenjoy and stick to a ",
                label5: "7 Min read",
                label6: " out there?",
                label7: "healthy food",
              )),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {},
            child: TipsAndTricksWidget(
              imageUrl: "assets/images/tipsImages/health.jfif",
              label1: "health",
              label2: "How Fit Can You Get From Just\n",
              label3: "Walking?",
              label4:
                  "walking is good for you, obviously, But can\nit whip you into shape ",
              label5: "3 Min read",
            ),
          ),
        ],
      ),
    );
  }
}
