import 'package:flutter/material.dart';

import '../../../model/about_model.dart';
import '../custom/my_image.dart';

class AboutCard extends StatelessWidget {
  final AboutRow about;
  final bool isList;
  final double width;

  const AboutCard({
    super.key,
    required this.about,
    required this.isList,
    required this.width,
  });

  @override
  Card build(BuildContext context) => Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  about.title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                subtitle: Visibility(
                  visible: about.description.isNotEmpty,
                  child: Text(
                    about.description,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ),
              if (about.imageUrl.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: MyImage(
                      about.imageUrl,
                      height: width / (isList ? 1.65 : 3),
                    ),
                  ),
                )
            ],
          ),
        ),
      );
}
