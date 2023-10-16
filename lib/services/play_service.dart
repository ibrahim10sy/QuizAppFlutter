import 'dart:convert';

import '../constantes.dart';
import '../models/Result.dart';
import '../models/question.dart';
import 'package:http/http.dart' as http;

class PlayService {
  static const baseUserUrl = "$baseUrl:9000/api/users";

  Future<Question> getNextQuestion(int userId, int quizId) async{
    // Cette méthode permet de lancer un quiz
    final response = await http.get(Uri.parse('$baseUserUrl/$userId/quizzes/$quizId/play'));

    if(response.statusCode == 200) {
      final responseData = json.decode(utf8.decode(response.bodyBytes));
      Question nextQuestion = Question.fromJson(responseData);
      return nextQuestion;
    }
    else{
      throw Exception("Error: Impossible de récuperer la question démandé");
    }
  }

  Future<Result?> endGame(int userId, int quizId) async {
    // Cette méthode met fin au jeux
    final response = await http.get(Uri.parse('$baseUserUrl/$userId/quizzes/$quizId/end'));

    if(response.statusCode == 200) {
      final responseData = json.decode(utf8.decode(response.bodyBytes));
      if(responseData != null) {
        Result result = Result.fromJson(responseData);
        return result;
      }
      else{
        null;
      }
    }
    else{
      throw Exception("Error: Impossible de mettre fin au jeux");
    }
    return null;
  }

  Future<Result> answerQuestion(int userId, int quizId, int answer) async {
    // Répondre à une question
    final response = await http.get(Uri.parse('$baseUserUrl/$userId/quizzes/$quizId/play?answer=$answer'));
    if(response.statusCode == 200) {
      final responseData = json.decode(utf8.decode(response.bodyBytes));
      Result result = Result.fromJson(responseData);
      return result;
    }
    else{
      throw Exception("Error: Impossible de récuperer le resultat démandé");
    }
  }

}