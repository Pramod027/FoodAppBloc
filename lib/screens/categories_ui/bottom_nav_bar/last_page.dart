import 'package:flutter/material.dart';

class LastPage extends StatefulWidget {
  const LastPage({Key key}) : super(key: key);
  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}
