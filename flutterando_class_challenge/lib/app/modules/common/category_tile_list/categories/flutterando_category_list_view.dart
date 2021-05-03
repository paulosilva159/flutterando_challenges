import 'package:flutter/material.dart';
import 'package:flutterando_class/app/modules/common/iconed_text.dart';
import 'package:flutterando_class/app/modules/common/see_all_button.dart';

class FlutterandoCategoryListViewTitle extends StatelessWidget {
  const FlutterandoCategoryListViewTitle({
    required this.categoryIconPathUrl,
    required this.categoryLabel,
  });

  final String categoryIconPathUrl;
  final String categoryLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconedText(
          iconPathUrl: categoryIconPathUrl,
          label: categoryLabel,
        ),
        RedirectionLabeledButton(
          label: 'ver todos',
        ),
      ],
    );
  }
}
