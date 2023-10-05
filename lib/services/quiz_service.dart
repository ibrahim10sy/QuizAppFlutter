import '../constantes.dart';
import '../models/quiz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuizService {
  static const baseQuizUrl = "${baseUrl}/api/quizzes";
  static const baseQuizUrlForUser = "${baseUrl}/api/users";
  // static const baseQuizUrl = "${baseUrl}:9000/api/quizzes";
  // static const baseQuizUrlForUser = "${baseUrl}:9000/api/users";

  Future<List<Quiz>?> getQuizzes(String category) async {
    final response =
        await http.get(Uri.parse(baseQuizUrl + "?domain=" + category));

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      List<Quiz> quizzes = [];
      for (var quiz in responseData) {
        quizzes.add(Quiz.fromJson(quiz));
      }
      return quizzes;
    }
    return null;
  }

  Future<Quiz?> getQuiz(int quizId) async {
    final response = await http.get(Uri.parse('$baseQuizUrl/$quizId'));
    if (response.statusCode == 200) {
      var responseDate = json.decode(response.body);
      Quiz quiz = Quiz.fromJson(responseDate);
      return quiz;
    }
    return null;
  }

  Future<List<Quiz>> getQuizzesByUser(int userId) async {
    // Obtenir les quiz pour un utilisateur
    final response =
        await http.get(Uri.parse('$baseQuizUrlForUser/$userId/quizzes'));
    if (response.statusCode == 200) {
      var responseDate = json.decode(response.body);
      List<Quiz> quizzes = [];
      for (var quiz in responseDate) {
        quizzes.add(Quiz.fromJson(quiz));
      }
      return quizzes;
    }
    return [];
  }

  Future<Quiz?> getQuizByUser(int userId, int quizId) async {
    // Obtenir un quiz pour un utilisateur
    final response = await http
        .get(Uri.parse('$baseQuizUrlForUser/$userId/quizzes/$quizId'));
    if (response.statusCode == 200) {
      var responseDate = json.decode(response.body);
      Quiz quiz = Quiz.fromJson(responseDate);
      return quiz;
    }
    return null;
  }

  Future<Quiz?> updateQuizByUser(
      int userId, int quizId, Quiz updateQuiz) async {
    // Mise à jour complete des données d'un quiz pour un utilisateur
    final response = await http.put(
        Uri.parse('$baseQuizUrlForUser/$userId/quizzes/$quizId'),
        body: json.encode(updateQuiz),);
    if (response.statusCode == 200) {
      var responseDate = json.decode(response.body);
      Quiz quiz = Quiz.fromJson(responseDate);
      return quiz;
    }
    return null;
  }

  Future<String> deleteQuiz(int userId, int quizId) async {
    final response = await http
        .delete(Uri.parse('$baseQuizUrlForUser/$userId/quizzes/$quizId'));
    if (response.statusCode == 200) {
      return "OK";
    }
    return "error";
  }

  // Future<Quiz?> createQuiz(int userId, Quiz quiz) async{
  //   print(quiz);
  //   final response = await http.post(Uri.parse('$baseQuizUrlForUser/$userId/quizzes'), body: quiz.toJson());
  //   if(response.statusCode == 200) {
  //     var responseDate = json.decode(response.body);
  //     Quiz quiz = Quiz.fromJson(responseDate);
  //     return quiz;
  Future<Quiz?> createQuiz(int userId, Quiz quiz) async {
    final response = await http.post(Uri.parse('$baseQuizUrlForUser/$userId/quizzes'),
      body: json.encode(quiz),
      headers: {
        // Je m'assure que le type de média est défini sur JSON
        'Content-Type':'application/json',
      },
    );

    if (response.statusCode == 200) {
      print("Success");
      var responseData = json.decode(response.body);
      Quiz createdQuiz = Quiz.fromJson(responseData);
      return createdQuiz;
    } else if (response.statusCode == 400) {
      Map<String, dynamic> errorMessage = {};
      // Si le statut de réponse est 400 (Bad Request), il y a une erreur de validation
      var errorResponse = json.decode(response.body);
      if (errorResponse.containsKey('message')) {
        errorMessage['message'] = errorResponse['message'];
      }
      if (errorResponse.containsKey('error')) {
        errorMessage['error'] = errorResponse['error'];
      }
      if (errorResponse.containsKey('status')) {
        errorMessage['status'] = errorResponse['status'];
      }
      print("ERROR: $errorMessage");
    } else {
      print("Unexpected Error");
    }
    return null;
  }

}
