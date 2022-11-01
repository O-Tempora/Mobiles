import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.add_box, color: Color.fromRGBO(212, 190, 242, 1.0)),
          label: const Text('Add', style: TextStyle(color: Color.fromRGBO(212, 190, 242, 1.0))),
          onPressed: (){},
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
              Color.fromRGBO(14, 70, 73, 1.0)
            ),
            padding: MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.all(2)
            )
          ),
        ),
      ),
    );
  }
}