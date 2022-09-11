import 'package:flutter/material.dart';

class SearchTextFieldPrefix extends StatelessWidget {
  final Widget prefix;
  final TextEditingController controller;
  final void Function(String val) func;

  const SearchTextFieldPrefix({
    Key? key,
    required this.prefix,
    required this.func,
    required this.controller,
  }) : super(key: key);

  @override
  DecoratedBox build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: Colors.transparent),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxHeight: 40),
          isDense: true,
          hintText: "Search",
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          prefixIcon: prefix,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        ),
        style: Theme.of(context).textTheme.caption,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        onChanged: (val) {
          if (controller.text.isNotEmpty) {
            controller.selection = TextSelection.fromPosition(
              TextPosition(offset: controller.text.length),
            );
          }
          func(controller.text);
        },
      ),
    );
  }
}
