import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final bool? isProcessing;
  const AppButton({super.key, this.title, this.onPressed, this.isProcessing});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(
            Size(MediaQuery.sizeOf(context).width * 0.9, 40.0)),
        maximumSize: WidgetStatePropertyAll(
            Size(MediaQuery.sizeOf(context).width * 0.9, 40.0)),
      ),
      onPressed: isProcessing! ? () {} : onPressed,
      child: Center(
        child: isProcessing! ? const CircularProgressIndicator() : Text(title!),
      ),
    );
  }
}
