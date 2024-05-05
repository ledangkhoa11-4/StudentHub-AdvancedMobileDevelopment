import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData icon;
  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        autofocus: autoFocus,
        textInputAction: inputAction,
        obscureText: this.isObscure,
        keyboardType: this.inputType,
        maxLines: this.inputType == TextInputType.multiline ? 5 : 1,
        minLines: this.inputType == TextInputType.multiline ? 3 : 1,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecoration(
            hintText: this.hint,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: hintColor),
            errorStyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),
            counterText: null,
            errorText: errorText != null && !errorText!.isEmpty ? errorText : null,
            errorMaxLines: 2,
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedErrorBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)) ,
            errorBorder:   OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            border:   OutlineInputBorder( borderSide: BorderSide(width: 1)),
            icon: this.isIcon ? Icon(this.icon, color:   errorText != null && !errorText!.isEmpty ? Theme.of(context).colorScheme.error : iconColor) : null),
      ),
    );
  }

  const TextFieldWidget({
    Key? key,
    required this.icon,
    required this.errorText,
    required this.textController,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
  }) : super(key: key);
}
