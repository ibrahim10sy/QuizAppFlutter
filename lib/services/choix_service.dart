import '../constantes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http ;
import '../models/choix.dart';


class Choix{
  static const baseUrlChoix = "${baseUrl}/api/users/";
  // /api/users/{userId}/quizzes/{quizId}/questions/{questionId}/choises

  static Future<List<Choix>?> getChoix(int userId, int quizId, int questionId) async {
    
  }

  ///création
  
  // Future<Choix?> createChoix(int userId, int quizId, int questionId , Choix choix) async {
  //   final response = await http.post(Uri.parse('$baseUrlChoix/$userId/quizzes/$quizId/questions/$questionId/choices'),
  //   body : json.encode(choix),
  //   headers : {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   });
    
  //    if(response.statusCode == 200) {
  //     print("Succèss");
  //     var responseData = json.decode(response.body);
  //     Choix createChoix = Choix.fromJson(responseData);
  //     return createChoix;
  //    }else{
  //     print("Erreur");
  //     return null;
  //    }
  // }
  
 
}