import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const _h1TextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );

  static const _primaryColor = Color(0xff324E97);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.white,
        ).copyWith(
          primary: _primaryColor,
          secondary: const Color(0xff973232),
        ),
        textTheme: const TextTheme(
          headline1: _h1TextStyle,
          headline2: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: _h1TextStyle,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter UI"),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Heading 1",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 20),
            Text(
              "Heading 2",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 20),
            Text(
              "Heading 3",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Primary Button"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.secondary,
              ),
              child: const Text("Secondary Button"),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              child: const Text("Outline Button"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
