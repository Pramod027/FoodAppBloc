import 'package:flutter/material.dart';

enum CardStatus { Pending, InProgress, Served }

class FoodItemStatus extends StatefulWidget {
  @override
  _FoodItemStatusState createState() => _FoodItemStatusState();
}

class _FoodItemStatusState extends State<FoodItemStatus> {
  int _status = CardStatus.Served.index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MaterialButton(
                child: Text('Click me'),
                onPressed: () {
                  setState(() {
                    _status = CardStatus.InProgress.index;
                  });
                }),
            CardStatus.Pending.index == _status
                ? NewWidget(
                    cardBackgroundColor: Colors.red,
                    cardRadiusColor: Colors.black,
                    cardText: 'Pending',
                  )
                : CardStatus.InProgress.index == _status
                    ? NewWidget(
                        cardBackgroundColor: Colors.pink,
                        cardRadiusColor: Colors.yellow,
                        cardText: 'text1',
                      )
                    : CardStatus.Served.index == _status
                        ? NewWidget(
                            cardBackgroundColor: Colors.green,
                            cardRadiusColor: Colors.amber,
                            cardText: 'text2',
                          )
                        : Container(),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final Color cardRadiusColor;

  final Color cardBackgroundColor;
  final String cardText;

  const NewWidget(
      {Key key, this.cardRadiusColor, this.cardBackgroundColor, this.cardText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(width: 1, color: cardRadiusColor),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Text(
          cardText,
          // style: AppStyle.smallRegular,
        ),
      ),
    );
  }
}
