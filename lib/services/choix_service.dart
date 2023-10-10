import '../constantes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http ;
import '../models/choise.dart';


class ChoixService{
   static const baseQuizUrlForUser = "${baseUrl}/api/users";
  // /api/users/{userId}/quizzes/{quizId}/questions/{questionId}/choises

  static Future<List<Choise>?> getChoix(int userId, int quizId, int questionId) async {
    
  }

  ///création
  
  Future<Choise?> createChoix(int userId, int quizId, int questionId , Choise choise) async {
    final response = await http.post(Uri.parse('$baseQuizUrlForUser/$userId/quizzes/$quizId/questions/$questionId/choices'),
    body : json.encode(choise),
    headers : {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    
     if(response.statusCode == 200) {
      print("Succèss");
      var responseData = json.decode(response.body);
      Choise createChoix = Choise.fromJson(responseData);
      return createChoix;
     }else{
      print("Erreur");
      return null;
     }
  }
  
 
}