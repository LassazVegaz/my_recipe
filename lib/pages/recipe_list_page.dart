import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/pages/view_recipe_page.dart';

class RecipeListPage extends StatefulWidget {
  static const path = '/recipe_list';
  const RecipeListPage({Key? key}) : super(key: key);

  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  Color primaryColor = const Color(0xff18203d);
  Color secondaryColor = const Color(0xff232c51);
  Color logoGreen = const Color(0xff25bcbb);

  TextEditingController nameController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController calorieController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: secondaryColor, border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.white),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }

  CollectionReference ref = FirebaseFirestore.instance.collection('recipe');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.folder_open,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ViewRecipePage()));
              },
            )
          ],
        ),
        backgroundColor: primaryColor,
        body: StreamBuilder(
            stream: ref.snapshots(),
            builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var doc = snapshot.data!.docs[index].data() as Map;
                      return ListTile(
                        leading: IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.white,
                          onPressed: () {
                            nameController.text = doc['name'];
                            ingredientsController.text = doc['ingredients'];
                            calorieController.text = doc['calorie'];
                            imageUrlController.text = doc['imageUrl'];
                            showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                      child: Container(
                                        color: primaryColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: <Widget>[
                                              _buildTextField(
                                                  nameController, 'Name'),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              _buildTextField(
                                                  ingredientsController,
                                                  'Ingredients'),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              _buildTextField(
                                                  calorieController, 'Calorie'),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              _buildTextField(
                                                  imageUrlController,
                                                  'Image Url'),
                                              const SizedBox(
                                                height: 20,
                                              ),

                                              //update recipe details
                                              ElevatedButton(
                                                child: const Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Text('Update Recipes'),
                                                ),
                                                onPressed: () {
                                                  snapshot.data!.docs[index]
                                                      .reference
                                                      .update({
                                                    "name": nameController.text,
                                                    "ingredients":
                                                        ingredientsController
                                                            .text,
                                                    "calorie":
                                                        calorieController.text,
                                                    "imageUrl":
                                                        imageUrlController.text,
                                                  }).whenComplete(() =>
                                                          Navigator.pop(
                                                              context));
                                                },
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),

                                              //Delete recipe details
                                              ElevatedButton(
                                                child: const Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Text('Delete Recipes'),
                                                ),
                                                onPressed: () {
                                                  snapshot.data!.docs[index]
                                                      .reference
                                                      .delete();
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                          },
                        ),
                        title: Text(
                          doc['name'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              doc['ingredients'],
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text(
                              doc['calorie'],
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        trailing: Image.network(
                          doc['imageUrl'],
                          height: 100,
                          fit: BoxFit.cover,
                          width: 100,
                        ),
                      );
                    });
              } else {
                return const Text('');
              }
            }));
  }
}
