import 'package:flutter/material.dart';
import 'package:hello_state/halamandua.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var judul = "Login";
  var body = "Ini body yang dibuat";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text('DrawerHeader'),
            ),
            ListTile(
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text("Pinjam"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyWidget(
                      parameter: "Isinya A",
                      parameter2: "Isinya B",
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.access_time_filled),
              title: Text("kembali"),
            )
          ],
        ),
      ),
      appBar: AppBar(title: Text(judul)),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          judul = "judul yang berubah";
          body = "Perubahan body yang terjadi";
        });

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MyWidget(
              parameter: "Isinya A",
              parameter2: "Isinya B",
            ),
          ),
        );
      }),
      body: Text(body),
    );
  }
}
