import '../constantes.dart';
import '../models/quiz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuizService {
  static const baseQuizUrl = "${baseUrl}:9000/api/quizzes?domain=";

  Future<List<Quiz>?> getQuizzes(String category) async{
    final response = await http.get(Uri.parse(baseQuizUrl+category));

    if(response.statusCode == 200) {
      var responseData = json.decode(response.body);
      List<Quiz> quizzes = [];
      for (var quiz in responseData) {
        quizzes.add(Quiz.fromJson(quiz));
      }
      return quizzes;
    }
    return null;
  }


  Future<Quiz?> getQuiz(int quizId) async{
    final response = await http.get(Uri.parse('$baseQuizUrl/$quizId'));
    if(response.statusCode == 200) {
      var responseDate = json.decode(response.body);
    }
    return null;
  }

  Future<Quiz?> updateQuiz(Quiz quiz) async{
    return null;
  }

  Future<String> deleteQuiz(int quizId) async{
    return "";
  }
}