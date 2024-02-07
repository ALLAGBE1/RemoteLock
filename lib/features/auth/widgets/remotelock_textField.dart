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
  final String? errorText; // Nouvelle propriété pour le message d'erreur

  @override
  State<RemoteLockTextField> createState() => _RemoteLockTextFieldState();
}

class _RemoteLockTextFieldState extends State<RemoteLockTextField> {
  bool _isObscured = true;
  // bool _isObscured = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.85,
      child: TextFormField(
        key: widget.textFieldKey,
        cursorColor: Colors.white,
        // obscureText: widget.obscureText! ? _isObscured == true : _isObscured,
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

// import 'package:flutter/material.dart';

// class RemoteLockTextField extends StatefulWidget {
//   const RemoteLockTextField(
//       {Key? key, this.labelText, this.hintText, required this.textFieldKey, this.obscureText = false})
//       : super(key: key);
//   final String? labelText;
//   final String? hintText;
//   final Key textFieldKey;
//   final bool? obscureText;

//   @override
//   _RemoteLockTextFieldState createState() => _RemoteLockTextFieldState();
// }

// class _RemoteLockTextFieldState extends State<RemoteLockTextField> {
//   bool _isObscured = true;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.85,
//       child: TextFormField(
//         key: widget.textFieldKey,
//         cursorColor: Colors.white,
//         obscureText: _isObscured,
//         decoration: InputDecoration(
//           labelText: widget.labelText,
//           labelStyle: TextStyle(color: Colors.white),
//           hintText: widget.hintText,
//           focusColor: Colors.red,
//           fillColor: Colors.yellow,
//           hintStyle: TextStyle(
//             color: Colors.white,
//           ),
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(width: 2),
//           ),
//           suffixIcon: IconButton(
//             icon: Icon(
//               _isObscured ? Icons.visibility : Icons.visibility_off,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               setState(() {
//                 _isObscured = !_isObscured;
//               });
//             },
//           ),
//         ),
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }


// class RemoteLockTextField extends StatelessWidget {
//   const RemoteLockTextField(
//       {Key? key, this.labelText, this.hintText, required this.textFieldKey, this.obscureText = false})
//       : super(key: key);
//   final String? labelText;
//   final String? hintText;
//   final Key textFieldKey;
//   final bool? obscureText;

//   @override
//   Widget build(BuildContext context) {
//     final ValueNotifier<bool> isObscured = ValueNotifier<bool>(true);
//     return ValueListenableBuilder<bool>(
//       valueListenable: isObscured,
//       builder: (context, isObscuredValue, ___) {
//         return SizedBox(
//           width: MediaQuery.sizeOf(context).width * 0.85,
//           child: TextFormField(
//             key: textFieldKey,
//             cursorColor: Colors.white,
//             obscureText: obscureText!,
//             decoration: InputDecoration(
//               labelText: labelText,
//               labelStyle: TextStyle(color: Colors.white),
//               hintText: hintText,
//               focusColor: Colors.red,
//               fillColor: Colors.yellow,
//               hintStyle: TextStyle(
//                 color: Colors.white,
//               ),
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(width: 2),
//               ),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   isObscuredValue ? Icons.visibility : Icons.visibility_off,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {
//                   isObscured.value = !isObscured.value;
//                 },
//               ),
//             ),
//             style: TextStyle(color: Colors.white),
//           ),
//         );
//       },
//     );
//   }
// }






// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// class RemoteLockTextField extends StatelessWidget {
//   const RemoteLockTextField(
//       {Key? key, this.labelText, this.hintText, required this.textFieldKey, this.obscureText = false})
//       : super(key: key);
//   final String? labelText;
//   final String? hintText;
//   final Key textFieldKey;
//   final bool? obscureText;

//   @override
//   Widget build(BuildContext context) {
//     bool isObscured = true;
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.85,
//       child: TextFormField(
//         key: textFieldKey,
//         cursorColor: Colors.white,
//         obscureText: obscureText!,
//         decoration: InputDecoration(
//           labelText: labelText,
//           labelStyle: TextStyle(color: Colors.white),
//           hintText: hintText,
//           focusColor: Colors.red,
//           fillColor: Colors.yellow,
//           hintStyle: TextStyle(
//             color: Colors.white,
//           ),
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(width: 2),
//           ),
//           suffixIcon: IconButton(
//             icon: Icon(
//               isObscured ? Icons.visibility : Icons.visibility_off,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               setState(() {
//                 isObscured = !isObscured;
//               });
//             },
//           ),
//         ),
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }
