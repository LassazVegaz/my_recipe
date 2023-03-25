import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_recipe/models/recipe_model.dart';

class ViewRecipePage extends StatefulWidget {
  static const path = '/recipe_page';
  const ViewRecipePage({Key? key}) : super(key: key);
  @override
  ViewRecipePageState createState() => ViewRecipePageState();
}

//recipe static page
class ViewRecipePageState extends State<ViewRecipePage> {
  List<Model> list = <Model>[];
  String? text;
  final url =
      'https://api.edamam.com/search?q=chicken&app_id=c51cc1ad&app_key=a5bc768cf935c188b767c369c1e81802	&from=0&to=100&calories=591-722&health=alcohol-free';
  getApiData() async {
    var response = await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    json['hits'].forEach((e) {
      //declaring recipe model
      Model model = Model(
          url: e['recipe']['url'],
          image: e['recipe']['image'],
          source: e['recipe']['source'],
          label: e['recipe']['label']);
      setState(() {
        list.add(model);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getApiData();
  }
  //view recipes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 51, 50, 50),
      appBar: AppBar(elevation: 0, title: const Text("Recipes")),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (v) {
                  text = v;
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                    hintText: "search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    fillColor: Colors.green.withOpacity(0.2),
                    filled: true),
              ),
              const SizedBox(
                height: 15,
              ),
              GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    final x = list[i];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebPage(
                                      url: x.url,
                                    )));
                      },
                      //declaring the recipe labels and source
                      child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(x.image.toString()))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(3),
                                height: 40,
                                color: Colors.white.withOpacity(0.4),
                                child: Center(child: Text(x.label.toString())),
                              ),
                              Container(
                                padding: const EdgeInsets.all(3),
                                height: 40,
                                color: Colors.white.withOpacity(0.4),
                                child: Center(
                                  child: Text("Source: ${x.source}"),
                                ),
                              )
                            ],
                          )),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class WebPage extends StatelessWidget {
  final dynamic url;
  const WebPage({this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: WebView(
      initialUrl: url,
    )));
  }
}
