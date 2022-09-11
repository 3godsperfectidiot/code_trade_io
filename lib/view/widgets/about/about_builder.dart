import 'package:code_trade_io/controller/provider/about_provider.dart';
import 'package:code_trade_io/view/widgets/about/about_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutBuilder extends StatelessWidget {
  const AboutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutDataList = Provider.of<AboutProvider>(context).getAboutData.rows;
    return ListView.builder(
      itemCount: aboutDataList.length,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      itemBuilder: (context, index) => AboutCard(about: aboutDataList[index]),
    );
  }
}
