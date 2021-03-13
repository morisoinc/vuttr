import 'package:flutter/material.dart';
import 'package:vuttr/ui/global/colors.dart';

class VTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? label;
  final String? errorText;

  VTextField({
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.label = '',
    this.errorText,
  });

  @override
  _VTextFieldState createState() => _VTextFieldState();
}

class _VTextFieldState extends State<VTextField> {
  final FocusNode focusNode = FocusNode();

  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        _hasFocus = focusNode.hasFocus;
        print('has focus $_hasFocus');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormField(
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: widget.errorText,
            fillColor: widget.errorText == null
                ? (_hasFocus ? kDarkestWhite : kDarkerWhite)
                : kMostLightestRed,
          ),
        ),
        widget.errorText == null
            ? Container()
            : Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  widget.errorText ?? '',
                  style: TextStyle(
                    color: kRed,
                  ),
                ),
              ),
      ],
    );
  }
}
