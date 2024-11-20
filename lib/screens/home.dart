import 'package:flutter/material.dart';
import 'package:goodbye_stale_mobile/widgets/action_button.dart';
import 'package:goodbye_stale_mobile/widgets/app_drawer.dart';

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
      drawer: const AppDrawer(),
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
              const Text("Tambah Produk"),
              const Text("Kamu telah menekan tombol Tambah Produk"),
              const Icon(Icons.add_sharp),
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(height: 10.0),
            ActionButton(
              const Text("Logout"),
              const Text("Kamu telah menekan tombol Logout"),
              const Icon(Icons.logout_sharp),
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
