import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/pages/recipe_list_page.dart';

class AddRecipePage extends StatefulWidget {
  static const path = '/add_recipe';
  const AddRecipePage({Key? key}) : super(key: key);
  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  Color primaryColor = const Color(0xff18203d);
  Color secondaryColor = const Color(0xff232c51);
  Color logoGreen = const Color(0xff25bcbb);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.folder_open,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RecipeListPage()));
              },
            )
          ],
        ),
        backgroundColor: primaryColor,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Recipes ',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                //declaring the attributes of recipe
                _buildTextField(nameController, 'Name'),
                const SizedBox(
                  height: 20,
                ),
                _buildTextField(ingredientsController, 'Ingredients'),
                const SizedBox(
                  height: 20,
                ),
                _buildTextField(calorieController, 'Calorie'),
                const SizedBox(
                  height: 20,
                ),
                _buildTextField(imageUrlController, 'Image Url'),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
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
