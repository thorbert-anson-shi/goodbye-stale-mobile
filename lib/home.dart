import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Goodbye::Stale",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            ActionButton(
              const Text("Lihat Daftar Produk"),
              const Text("Kamu telah menekan tombol Lihat Daftar Produk"),
              const Icon(Icons.remove_red_eye_sharp),
              Theme.of(context).colorScheme.tertiary,
              Theme.of(context).colorScheme.onTertiary,
            ),
            const SizedBox(height: 10.0),
            ActionButton(
              const Text("Logout"),
              const Text("Kamu telah menekan tombol Logout"),
              const Icon(Icons.logout_sharp),
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.onSecondary,
            ),
            const SizedBox(height: 10.0),
            ActionButton(
              const Text("Tambah Produk"),
              const Text("Kamu telah menekan tombol Tambah Produk"),
              const Icon(Icons.add_sharp),
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}

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
        final snackBar = SnackBar(
          content: snackBarText,
          action: SnackBarAction(
            label: 'Undo',
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
