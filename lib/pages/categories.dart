import 'package:flutter/material.dart';

class Categorie extends StatefulWidget {
  const Categorie({super.key});

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  @override
  Widget build(BuildContext context) {
    Color myColor = Color(0xFF1C1A5E);
    return Scaffold(
      backgroundColor: (myColor),
      /*appBar: AppBar(
         backgroundColor:(myColor) ,
         elevation: 0,
      toolbarHeight: 70,
      centerTitle: true,
      title: Text("Categories",style: TextStyle(
        color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25
      ),),
     ),*/
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),



              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(10),
                      height: 150, 
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: Colors.red),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                //color: Colors.red,
                               // child: Image(image: AssetImage("assetName")),
                                child: Image.asset("assets/image/image 10.png", height: 60, width: 70,),
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                //color: Colors.green,
                                child: const Center(
                                  child: Text(
                                                  "Animaux",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(255, 111, 82, 82),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                      ),
                                )),),
                        ],
                      ),
                    ),
                  ),
        
                  ///////////////
                  ///
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 150, 
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: Colors.white),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                //color: Colors.red,
                               // child: Image(image: AssetImage("assetName")),
                                child: Image.asset("assets/image/image 4.png", height: 60, width: 70,),
                                
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                //color: Colors.green,
                                child: const Center(
                                  child: Text(
                                                  "Music",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                      ),
                                )),),
                        ],
                      ),
                    ),
                  ),            
                   ],
              ),  
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(10),
                      height: 150, 
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: Colors.white),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                //color: Colors.red,
                               // child: Image(image: AssetImage("assetName")),
                                child: Image.asset("assets/image/image 5.png", height: 60, width: 70,),
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                //color: Colors.green,
                                child: const Center(
                                  child: Text(
                                                  "Maths",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                      ),
                                )),),
                        ],
                      ),
                    ),
                  ),
        
                  ///////////////
                  ///
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 150, 
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: Colors.white),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                //color: Colors.red,
                               // child: Image(image: AssetImage("assetName")),
                                child: Image.asset("assets/image/image 12.png", height: 60, width: 70,),
                                
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                //color: Colors.green,
                                child: const Center(
                                  child:  Text(
                                                  "Games",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                      ),
                                )),),
                        ],
                      ),
                    ),
                  ),            
                   ],
              ),  
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(10),
                      height: 150, 
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: Colors.white),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                //color: Colors.red,
                               // child: Image(image: AssetImage("assetName")),
                                child: Image.asset("assets/image/image 14.png", height: 60, width: 70,),
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                //color: Colors.green,
                                child: const Center(
                                  child: Text(
                                                  "Space",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                      ),
                                )),),
                        ],
                      ),
                    ),
                  ),
        
                  ///////////////
                  ///
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 150, 
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: Colors.white),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                //color: Colors.red,
                               // child: Image(image: AssetImage("assetName")),
                                child: Image.asset("assets/image/image 13.png", height: 60, width: 70,),
                                
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                //color: Colors.green,
                                child: const Center(
                                  child: Text(
                                                  "Sports",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                      ),
                                )),),
                        ],
                      ),
                    ),
                  ),            
                   ],
              ),  
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(10),
                      height: 150, 
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: Colors.white),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                //color: Colors.red,
                               // child: Image(image: AssetImage("assetName")),
                                child: Image.asset("assets/image/image 16.png", height: 60, width: 70,),
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                //color: Colors.green,
                                child: const Center(
                                  child: Text(
                                                  "Hacking",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                      ),
                                )),),
                        ],
                      ),
                    ),
                  ),
        
                  ///////////////
                  ///
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 150, 
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: Colors.white),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                //color: Colors.red,
                               // child: Image(image: AssetImage("assetName")),
                                child: Image.asset("assets/image/image 17.png", height: 60, width: 70,),
                                
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                //color: Colors.green,
                                child: const Center(
                                  child: Text(
                                                  "Java",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                      ),
                                )),),
                        ],
                      ),
                    ),
                  ),            
                   ],
              ),  

             /* GestureDetector(
                onTap: (){ print("ok");
                  setState(() {
                   
                  });
                },
                child: Text(
                                                    "Test  text",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15),
                                                        ),
              ), */

/*FilledButton(onPressed: (){
  print("Cliquer 2");
                  setState(() {
                   
                  });
}, child:  Text(
                                                    "Test  text",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15),
                                                        ),), */

              /*ElevatedButton(onPressed: (){print("Cliquer");
                  setState(() {
                   
                  });}, child:  Text(
                                                    "Test  text",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15),
                                                        ),) */
        
            /*  GridView.builder(shrinkWrap: true,itemCount: 5,gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index) {
                return  Container(
                      margin: EdgeInsets.all(10),
                      height: 200, 
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: Colors.amber),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                //color: Colors.red,
                               // child: Image(image: AssetImage("assetName")),
                                child: Icon(Icons.add_circle_rounded,color: Colors.white,size: 100),
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                //color: Colors.green,
                                child: Center(
                                  child: Text(
                                                  "Titre Quiz",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                      ),
                                )),),
                        ],
                      ),
                    );
              },)*/
            ],
          ),
        ),
      ),
    );
  }
}
