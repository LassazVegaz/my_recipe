import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/firebase_options.dart';
import 'package:my_recipe/pages/recipe_list.dart';

import '../main.dart';

class AddRecipe extends StatefulWidget {
  static const path = '/add_recipe';
  const AddRecipe({Key? key}) : super(key: key);
  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);
  //declaring attributes
  TextEditingController nameController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController calorieController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  //connect with database table named as recipe
  late Map<String, dynamic> recipeToAdd;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("recipe");

  addRecipe() {
    recipeToAdd = {
      "name": nameController.text,
      "ingredients": ingredientsController.text,
      "calorie": calorieController.text,
      "imageUrl": imageUrlController.text,
    };
    //create recipes
    collectionReference
        .add(recipeToAdd)
        .whenComplete(() => print('Added recipe'));
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.folder_open,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ListScreen()));
              },
            )
          ],
        ),
        backgroundColor: primaryColor,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Recipes ',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                //declaring the attributes of recipe
                _buildTextField(nameController, 'Name'),
                SizedBox(
                  height: 20,
                ),
                _buildTextField(ingredientsController, 'Ingredients'),
                SizedBox(
                  height: 20,
                ),
                _buildTextField(calorieController, 'Calorie'),
                SizedBox(
                  height: 20,
                ),
                _buildTextField(imageUrlController, 'Image Url'),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Add Recipes'),
                  ),
                  onPressed: () {
                    addRecipe();
                  },
                )
              ],
            ),
          ),
        ));
  }
}
