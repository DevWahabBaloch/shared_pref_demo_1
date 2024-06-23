import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final Widget _child;
  AppTextField({
    super.key,
    final Function(String value)? onChanged,
    required final TextInputType type,
    final TextInputAction? inputAction,
    required String hint,
    required TextEditingController textEditingController,
  }) : _child = _TextField(
          onChanged: onChanged,
          type: type,
          inputAction: inputAction,
          hint: hint, textEditingController: textEditingController,
        );

  AppTextField.password({
    super.key,
    final Function(String value)? onChanged,
    required String? hint,
    required final TextInputType type,
    final TextInputAction? inputAction,
    required final TextEditingController textEditingController,
  }) : _child = _TextFieldPassword(
          onChanged: onChanged,
          hint: hint,
          type: type,
          inputAction: inputAction, textEditingController: textEditingController,
        );

  AppTextField.icon({
    super.key,
    final Function(String value)? onChanged,
    final TextInputAction? inputAction,
  }) : _child = _TextFieldIcon(
          onChanged: onChanged,
          inputAction: inputAction,
        );

  @override
  Widget build(BuildContext context) {
    return _child;
  }
}

class _TextField extends StatelessWidget {
  final Function(String)? onChanged;
  final String? hint;
  final TextInputType type;
  final TextInputAction? inputAction;
final TextEditingController textEditingController;
  const _TextField(
      {this.onChanged,
      required this.type,
      required this.hint,
      this.inputAction, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: type,
      textInputAction: inputAction,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
      ),
    );
  }
}

class _TextFieldPassword extends StatefulWidget {
  final Function(String)? onChanged;
  final String? hint;
  final TextInputType type;
  final TextInputAction? inputAction;
final TextEditingController textEditingController;
  const _TextFieldPassword(
      {this.onChanged, this.hint, required this.type, this.inputAction, required this.textEditingController});

  @override
  State<_TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<_TextFieldPassword> {
  bool _isHidden = true;
  void _showOrHidePassword() {
    // setState(() {
    _isHidden = !_isHidden;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      textInputAction: widget.inputAction,
      keyboardType: widget.type,
      obscureText: _isHidden,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
        hintText: widget.hint,
        suffixIcon: InkWell(
          onTap: () => _showOrHidePassword(),
          child: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}

class _TextFieldIcon extends StatelessWidget {
  final Function(String)? onChanged;
  final TextInputAction? inputAction;

  const _TextFieldIcon({this.onChanged, this.inputAction});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textInputAction: inputAction,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
        suffixIcon: Icon(Icons.person),
      ),
    );
  }
}
