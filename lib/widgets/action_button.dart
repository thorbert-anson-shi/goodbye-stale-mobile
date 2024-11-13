import 'package:flutter/material.dart';
import 'package:goodbye_stale_mobile/screens/new_recipe_form.dart';

class ActionButton extends StatelessWidget {
  final Text text;
  final Text snackBarText;
  final Icon icon;
  final Color bgColor;
  final Color fgColor;

  const ActionButton(
      this.text, this.snackBarText, this.icon, this.bgColor, this.fgColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (text.data == "Tambah Produk") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewRecipeForm()));
          return;
        }

        final snackBar = SnackBar(
          content: snackBarText,
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          text,
          const SizedBox(width: 10.0),
          icon,
        ],
      ),
    );
  }
}
