
import 'package:flutter/material.dart';

class Classement extends StatefulWidget {
  const Classement({super.key});

  @override
  State<Classement> createState() => _ClassementState();
}

class _ClassementState extends State<Classement> {
  @override
  Widget build(BuildContext context) {
    var numQues =  [1, 2, 3, 4, 5];
    var results = [5,10,30,-8,20];
    Color myColor = Color(0xFF1C1A5E);
    return Scaffold(
      backgroundColor: (myColor),
   
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Classements",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),



              Row(
                children: [
                  SizedBox(height: 20,),
                  // ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(7,40,5,0),
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), color: Colors.white),
                      child: Column(
                  
                        children: [
                         
                          Expanded(
                            
                              flex: 5,
                              child: Container(

                                //color: Colors.red,
                               // child: Image(image: AssetImage("assetName")),
                                child:
                                Column(
                                   children: [
                                    SizedBox(height: 10,),
                                    Center(child: Text('#2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black,),),),
                                    Center(
                                     child: 
                                 Image.asset("assets/image/image 19.png", height: 60, width: 70,),
                                    ),
                                    Center(child: Text('Mike L', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black,),),),
                                    SizedBox(height: 7,),
                                    Center(child: 
                                     Text('700 points', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black,),),),
                                   
                                   ],
                                  
                                ),
                              ),
                              ),
                       
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    
                    child: Container(
                        margin: EdgeInsets.fromLTRB(5,0,5,0),
                        
                      height: 150,
                      
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), color: Colors.white),
                      child:
                      
                       Column(
                        
                     
                        children: [
                         
                          Expanded(
                            
                              flex: 5,
                              child: Container(

                                //color: Colors.red,
                               // child: Image(image: AssetImage("assetName")),
                                child:
                                Column(
                                   children: [
                                    SizedBox(height: 10,),
                                    Center(child: Text('#1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black,),),),
                                    Center(
                                     child: 
                                 Image.asset("assets/image/image 19.png", height: 60, width: 70,),
                                    ),
                                    Center(child: Text('Mike L', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black,),),),
                                    SizedBox(height: 7,),
                                    Center(child: 
                                     Text('900 points', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black,),),),
                                   
                                   ],
                                  
                                ),
                              ),
                              ),
                        
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    
                    child: Container(
                      
                        margin: EdgeInsets.fromLTRB(7,40,5,0),
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), color: Colors.white),
                      child: Column(
                      
                        children: [
                         
                          Expanded(
                            
                              flex: 5,
                              child: Container(

                                //color: Colors.red,
                               // child: Image(image: AssetImage("assetName")),
                                child:
                                Column(
                                   children: [
                                    SizedBox(height: 10,),
                                    Center(child: Text('#3', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black,),),),
                                    Center(
                                     child: 
                                 Image.asset("assets/image/image 19.png", height: 60, width: 70,),
                                    ),
                                    Center(child: Text('Mike L', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black,),),),
                                    SizedBox(height: 7,),
                                    Center(child: 
                                     Text('500 points', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black,),),),
                                   
                                   ],
                                  
                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
        
                  ///////////////
                  ///
                            
                   ],
              ),  


    // bas  
              Column(
                
              children: [
                const  SizedBox(height: 15,),
             Padding(padding: EdgeInsets.all(10),),
              
                const SizedBox(height: 10,),
                // question 1
               Container(
                 decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  
                  ),
                    height: 65,
                    width: 370,  
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    //Question 1
                   const Padding(padding:EdgeInsets.only(left: 10),),
                    Text( "#4", style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),

                        SizedBox(width: 20, ),
                      Column(children: [
                        
                        Padding(padding: EdgeInsets.only(top: 6),),
                        Positioned(child:
                         Image.asset('assets/image/image 19.png'),),
                      ],),
                        SizedBox(width: 13, ),
                      Column(
                        children: [
                        Padding(padding: EdgeInsets.only(top: 18),),
                         Text('Moussa Bane', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                        ],
                      ), 
                        SizedBox(width: 13,),
                      Column(
                   
                        children: [
                        Padding(padding: EdgeInsets.only(top: 10),),
                          CircleAvatar(child: Icon(Icons.download, color: Colors.red,),
                          backgroundColor: Color(0xFFF6B9AA),
                          )
                        ],
                      ),
                     SizedBox(width: 5,),
                      Expanded(child: Center(
                        
                        child: 
                    Text("200 pts", style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),
                      ),),
                      // fin question 1
                  
                  ],
                 ), 
               ),
              ],
              ),
              Column(
                
              children: [
                const  SizedBox(height: 15,),
             Padding(padding: EdgeInsets.all(10),),
              
                // question 1
               Container(
                 decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  
                  ),
                    height: 65,
                    width: 370,  
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    //Question 1
                   const Padding(padding:EdgeInsets.only(left: 10),),
                    Text( "#5", style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),

                        SizedBox(width: 20, ),
                      Column(children: [
                        
                        Padding(padding: EdgeInsets.only(top: 6),),
                        Positioned(child:
                         Image.asset('assets/image/image 19.png'),),
                      ],),
                        SizedBox(width: 13, ),
                      Column(
                        children: [
                        Padding(padding: EdgeInsets.only(top: 18),),
                         Text('Moussa Bane', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                        ],
                      ), 
                        SizedBox(width: 13,),
                      Column(
                   
                        children: [
                        Padding(padding: EdgeInsets.only(top: 10),),
                          CircleAvatar(child: Icon(Icons.download, color: Colors.green,),
                          backgroundColor: Color(0xFFD5EDDC),
                          )
                        ],
                      ),
                     SizedBox(width: 5,),
                      Expanded(child: Center(
                        
                        child: 
                    Text("200 pts", style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),
                      ),),
                      // fin question 1
                  
                  ],
                 ), 
               ),
              ],
              ),
              Column(
                
              children: [
                const  SizedBox(height: 15,),
             Padding(padding: EdgeInsets.all(10),),
              
                // question 1
               Container(
                 decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  
                  ),
                    height: 65,
                    width: 370,  
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    //Question 1
                   const Padding(padding:EdgeInsets.only(left: 10),),
                    Text( "#6", style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),

                        SizedBox(width: 20, ),
                      Column(children: [
                        
                        Padding(padding: EdgeInsets.only(top: 6),),
                        Positioned(child:
                         Image.asset('assets/image/image 19.png'),),
                      ],),
                        SizedBox(width: 13, ),
                      Column(
                        children: [
                        Padding(padding: EdgeInsets.only(top: 18),),
                         Text('Moussa Bane', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                        ],
                      ), 
                        SizedBox(width: 13,),
                      Column(
                   
                        children: [
                        Padding(padding: EdgeInsets.only(top: 10),),
                          CircleAvatar(child: Icon(Icons.download, color: Colors.red,),
                          backgroundColor: Color(0xFFF6B9AA),
                          )
                        ],
                      ),
                     SizedBox(width: 5,),
                      Expanded(child: Center(
                        
                        child: 
                    Text("200 pts", style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),
                      ),),
                      // fin question 1
                  
                  ],
                 ), 
               ),
              ],
              ),
              Column(
                
              children: [
                const  SizedBox(height: 15,),
             Padding(padding: EdgeInsets.all(10),),
              
                // question 1
               Container(
                 decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  
                  ),
                    height: 65,
                    width: 370,  
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    //Question 1
                   const Padding(padding:EdgeInsets.only(left: 10),),
                    Text( "#7", style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),

                        SizedBox(width: 20, ),
                      Column(children: [
                        
                        Padding(padding: EdgeInsets.only(top: 6),),
                        Positioned(child:
                         Image.asset('assets/image/image 19.png'),),
                      ],),
                        SizedBox(width: 13, ),
                      Column(
                        children: [
                        Padding(padding: EdgeInsets.only(top: 18),),
                         Text('Moussa Bane', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                        ],
                      ), 
                        SizedBox(width: 13,),
                      Column(
                   
                        children: [
                        Padding(padding: EdgeInsets.only(top: 10),),
                          CircleAvatar(child: Icon(Icons.download, color: Colors.red,),
                          backgroundColor: Color(0xFFD5EDDC),
                          )
                        ],
                      ),
                     SizedBox(width: 5,),
                      Expanded(child: Center(
                        
                        child: 
                    Text("200 pts", style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),
                      ),),
                      // fin question 1
                  
                  ],
                 ), 
               ),
              ],
              ),
              Column(
                
              children: [
                const  SizedBox(height: 15,),
             Padding(padding: EdgeInsets.all(10),),
              
                // question 1
               Container(
                 decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  
                  ),
                    height: 65,
                    width: 370,  
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    //Question 1
                   const Padding(padding:EdgeInsets.only(left: 10),),
                    Text( "#8", style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),

                        SizedBox(width: 20, ),
                      Column(children: [
                        
                        Padding(padding: EdgeInsets.only(top: 6),),
                        Positioned(child:
                         Image.asset('assets/image/image 19.png'),),
                      ],),
                        SizedBox(width: 13, ),
                      Column(
                        children: [
                        Padding(padding: EdgeInsets.only(top: 18),),
                         Text('Moussa Bane', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                        ],
                      ), 
                        SizedBox(width: 13,),
                      Column(
                   
                        children: [
                        Padding(padding: EdgeInsets.only(top: 10),),
                          CircleAvatar(child: Icon(Icons.download, color: Colors.red,),
                          backgroundColor: Color(0xFFF6B9AA),
                          )
                        ],
                      ),
                     SizedBox(width: 5,),
                      Expanded(child: Center(
                        
                        child: 
                    Text("200 pts", style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),
                      ),),
                      // fin question 1
                  
                  ],
                 ), 
               ),
              ],
              ),
              
              
           
            ],
          ),
          
        ),
      
        
      ),
      
    );
  }
}