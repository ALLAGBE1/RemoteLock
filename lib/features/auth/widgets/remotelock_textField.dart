import 'package:flutter/material.dart';

class RemoteLockTextField extends StatefulWidget {
  const RemoteLockTextField(
      {super.key,
      this.labelText,
      this.hintText,
      required this.textFieldKey,
      this.obscureText = false,
      this.showToggleVisibility = true,
      this.errorText});
  final String? labelText;
  final String? hintText;
  final Key textFieldKey;
  final bool? obscureText;
  final bool showToggleVisibility;
  final String? errorText; 

  @override
  State<RemoteLockTextField> createState() => _RemoteLockTextFieldState();
}

class _RemoteLockTextFieldState extends State<RemoteLockTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.85,
      child: TextFormField(
        key: widget.textFieldKey,
        cursorColor: Colors.white,
        obscureText: widget.showToggleVisibility ? _isObscured : false,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: Colors.white),
          hintText: widget.hintText,
          focusColor: Colors.red,
          fillColor: Colors.yellow,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          suffixIcon: widget.showToggleVisibility
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
          errorText: widget.errorText,
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
