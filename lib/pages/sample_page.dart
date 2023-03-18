import 'package:flutter/material.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({Key? key}) : super(key: key);

  static const path = "/sample";

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
