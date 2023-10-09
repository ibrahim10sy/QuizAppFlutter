import '../constantes.dart';
import '../models/question.dart';
import 'dart:convert';
import 'package:http/http.dart' as http ;


class QuestionService {

  static const baseUrlQuestion = "${baseUrl}/api/users/";
  // {userId}/quizzes/{quizId}/questions

//obtenir les questions 
  static Future<List<Question>?> getQuestions(int userId, int quizId) async {
  
  }

  Future<Question?> createQuestion(int userId, int quizId, Question question) async {
    final response  =await http.post(Uri.parse('$baseUrlQuestion/$userId/quizzes/$quizId/questions'),
    body: json.encode(question),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if(response.statusCode == 200) {
      print("Succèss");
      var responseData = json.decode(response.body);
      Question createQuestion = Question.fromJson(responseData);
      return createQuestion;
    } else{
      print("Erreur");
      return null;
    }
  }

}