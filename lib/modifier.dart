// import 'package:flutter/material.dart';

// class EditAttributesPage extends StatefulWidget {
//   final String title;
//   final int nbQuestion;
//   final String visibility;
//   final String description;
//   final String? creationDate;
//   final String category;
//   final String imageUrl;

//   EditAttributesPage({
//     required this.title,
//     required this.nbQuestion,
//     required this.visibility,
//     required this.description,
//     this.creationDate,
//     required this.category,
//     required this.imageUrl,
//   });

//   @override
//   _EditAttributesPageState createState() => _EditAttributesPageState();
// }

// class _EditAttributesPageState extends State<EditAttributesPage> {
//   // Create TextEditingController for each attribute
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController nbQuestionController = TextEditingController();
//   final TextEditingController visibilityController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController creationDateController = TextEditingController();
//   final TextEditingController categoryController = TextEditingController();
//   final TextEditingController imageUrlController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the controllers with the current values
//     titleController.text = widget.title;
//     nbQuestionController.text = widget.nbQuestion.toString();
//     visibilityController.text = widget.visibility;
//     descriptionController.text = widget.description;
//     creationDateController.text = widget.creationDate ?? "";
//     categoryController.text = widget.category;
//     imageUrlController.text = widget.imageUrl;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Modifier les attributs'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: titleController,
//               decoration: InputDecoration(labelText: 'Titre'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: nbQuestionController,
//               decoration: InputDecoration(labelText: 'Nombre de questions'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: visibilityController,
//               decoration: InputDecoration(labelText: 'Visibilité'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: descriptionController,
//               decoration: InputDecoration(labelText: 'Description'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: creationDateController,
//               decoration: InputDecoration(labelText: 'Date de création'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: categoryController,
//               decoration: InputDecoration(labelText: 'Catégorie'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: imageUrlController,
//               decoration: InputDecoration(labelText: 'URL de l\'image'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Add code to save the updated values
//               },
//               child: Text('Enregistrer'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class EditAttributesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: DropdownButton<String>(
            items: <String>['Question1', 'Question2', 'Question3']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete_sharp),
              color: Colors.red,
              iconSize: 30,
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 20,
              ),
              Container(
                height: 200,
                width: 380,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/background-quiz-card.jpg')),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed:
                      () {}, // Ajoutez votre fonctionnalité d'ajout d'image ici
                  icon: Icon(Icons.add_a_photo_outlined),
                  iconSize: 50,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                width: 340,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: Colors.white),
                child: Center(child: Text('Entrez la réponse 2')),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.count(crossAxisCount: 1, children: [
                  Column(
                    children: List.generate(5, (index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 50,
                                width: 250,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    color: Colors.white),
                                child:
                                    Center(child: Text('Entrez la réponse 2')),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration:
                                    BoxDecoration(color: Colors.blueGrey),
                              )
                            ]),
                      );
                    }),
                  ),
                ]),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(
              //       height: 50,
              //       width: 250,
              //       decoration: BoxDecoration(
              //           border: Border.all(color: Colors.black, width: 2),
              //           color: Colors.white),
              //       child: Center(child: Text('Entrez la réponse 2')),
              //     ),
              //     Container(
              //       width: 50,
              //       height: 50,
              //       decoration: BoxDecoration(color: Colors.blueGrey),
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
