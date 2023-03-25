import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/firebase_options.dart';
import 'package:my_recipe/pages/recipe_page.dart';
import 'package:my_recipe/theme.dart';
import '../main.dart';


class ListScreen extends StatefulWidget {
   static const path = '/recipe_list';
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  TextEditingController nameController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController calorieController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: secondaryColor, border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
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
          backgroundColor: Colors.transparent, elevation: 0, 
           actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.folder_open,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => RecipePage()));
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
                          icon: Icon(Icons.edit),
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
                                              SizedBox(
                                                height: 20,
                                              ),
                                              _buildTextField(
                                                  ingredientsController,
                                                  'Ingredients'),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              _buildTextField(
                                                  calorieController, 'Calorie'),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              _buildTextField(
                                                  imageUrlController,
                                                  'Image Url'),
                                              SizedBox(
                                                height: 20,
                                              ),

                                              //update recipe details
                                              ElevatedButton(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
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
                                              SizedBox(
                                                height: 20,
                                              ),

                                              //Delete recipe details
                                              ElevatedButton(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
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
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Column(
                          children: <Widget>[
                            Text(
                              doc['ingredients'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              doc['calorie'],
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        trailing: Image.network(
                          doc['imageUrl'],
                          height: 100,
                          fit: BoxFit.cover,
                          width: 100,
                        ),
                      );
                    });
              } else
                return Text('');

              return Container();
            }));
  }
}
