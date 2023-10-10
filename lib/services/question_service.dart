import '../constantes.dart';
import '../models/question.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuestionService {
  const QuestionService();
  static const baseQestionUrlForUser = "$baseUrl/api/users";

  // Obtenir les questions
  static Future<List<Question>?> getQuestions(int userId, int quizId) async {
    final response = await http.get(Uri.parse('$baseQestionUrlForUser/$userId/quizzes/$quizId/questions'));

    if (response.statusCode == 200) {
      Iterable responseData = json.decode(response.body);
      List<Question> questions = responseData.map((json) => Question.fromJson(json)).toList();
      return questions;
    } else {
      print("Erreur lors de la récupération des questions.");
      return null;
    }
  }

  Future<Question?> createQuestion(int userId, int quizId, Question question) async {
    final response = await http.post(
      Uri.parse('$baseQestionUrlForUser/$userId/quizzes/$quizId/questions'),
      body: json.encode(question), // Convertissez la question en JSON
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //print(jsonEncode(question));

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      Question createdQuestion = Question.fromJson(responseData);
      print("Je suis ici: $createdQuestion");
      return createdQuestion;
    } else {
      print("Erreur lors de la création de la question. ${response.statusCode}");
      return null;
    }
  }
}
