import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constants/size_config.dart';

InputDecoration ichinsanInputDecoration(
    {IconData? prefixIcon,
    String? hint,
    Color? bgColor,
    Color? borderColor,
    EdgeInsets? padding}) {
  return InputDecoration(
    contentPadding:
        padding ?? EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    counter: Offstage(),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: borderColor ?? NowUIColors.info)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
    ),
    fillColor: bgColor ?? NowUIColors.info.withOpacity(0.04),
    hintText: hint,
    prefixIcon:
        prefixIcon != null ? Icon(prefixIcon, color: NowUIColors.info) : null,
    hintStyle: secondaryTextStyle(),
    filled: true,
  );
}

class TextFieldWidget extends StatefulWidget {
  String? label;
  int? maxLines;
  final int maxLength;
  final String content;
  final String hint;
  final ValueChanged<String> onChanged;
  TextFieldWidget(
      {Key? key,
      label = '',
      maxLines = 1,
      required this.content,
      required this.hint,
      required this.onChanged,
      required this.maxLength})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.content);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label.isEmptyOrNull
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(widget.label!, style: boldTextStyle(size: 14))),
          const SizedBox(height: spacing_standard),
          TextField(
            controller: controller,
            decoration: ichinsanInputDecoration(hint: widget.hint),
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
          )
        ],
      );
}
