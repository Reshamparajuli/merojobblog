import 'package:flutter/material.dart';

class MyIconButton extends StatefulWidget {
  const MyIconButton({super.key, required this.icon, required this.position, this.onPressed});
  final IconData icon;
  final String position;
  final void Function()? onPressed;
  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        height: widget.position == 'top'? 15.0:20.0,
        width:  widget.position == 'top'? 15.0:20.0,
        child: IconButton(
            onPressed: widget.onPressed,
            padding: const EdgeInsets.all(0.0),
            icon: Icon(
              widget.icon,
              color: Colors.grey[600],
              size: widget.position == 'top'? 15.0:20.0,
            )),
      ),
    );
  }
}
