import 'package:flutter/material.dart';

class ChoiceTab extends StatelessWidget {
  const ChoiceTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: TabBar(
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        padding: EdgeInsets.all(0),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        tabs: [
          Tab(
            text: 'Popular',
          ),
          Tab(text: 'Albums'),
          Tab(text: 'Songs'),
          Tab(text: 'Fans also like'),
        ],
      ),
    );
  }
}
