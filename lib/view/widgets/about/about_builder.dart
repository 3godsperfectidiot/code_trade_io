import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider/about_provider.dart';
import 'about_card.dart';
import '../custom/my_loader.dart';

class AboutBuilder extends StatelessWidget {
  const AboutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutDataList = Provider.of<AboutProvider>(context).getAboutData.rows;
    final double width = MediaQuery.of(context).size.width;
    return aboutDataList.isNotEmpty
        ? LayoutBuilder(
            builder: (context, constraints) => ListView.builder(
              itemCount: aboutDataList.length,
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: constraints.maxWidth < 450 ? 10 : width / 5,
              ),
              itemBuilder: (context, index) => AboutCard(
                about: aboutDataList[index],
                width: width,
                isList: constraints.maxWidth < 450,
              ),
            ),
          )
        : const CenterMessage("We couldn't found any matching data.");
  }
}
