import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
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
  State<TextFieldWidget> createState() => _TextFieldWidgetState();

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

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget.inputType == TextInputType.visiblePassword ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        controller: widget.textController,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: widget.onChanged,
        autofocus: widget.autoFocus,
        textInputAction: widget.inputAction,
        obscureText: _passwordVisible,
        keyboardType: this.widget.inputType,
        maxLines: this.widget.inputType == TextInputType.multiline ? 5 : 1,
        minLines: this.widget.inputType == TextInputType.multiline ? 3 : 1,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecoration(
            hintText: this.widget.hint,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: widget.hintColor),
            errorStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),
            counterText: null,
            errorText: widget.errorText != null && !widget.errorText!.isEmpty
                ? widget.errorText
                : null,
            errorMaxLines: 2,
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedErrorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            errorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
            icon: this.widget.isIcon
                ? Icon(this.widget.icon,
                    color:
                        widget.errorText != null && !widget.errorText!.isEmpty
                            ? Theme.of(context).colorScheme.error
                            : widget.iconColor)
                : null,
            suffixIcon: widget.inputType == TextInputType.visiblePassword
                ? IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  )
                : null),
      ),
    );
  }
}
