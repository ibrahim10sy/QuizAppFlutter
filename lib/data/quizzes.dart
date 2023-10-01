import 'package:quiz_app/models/user.dart';

import '../models/quiz.dart';

List<User> users = [
  User(name: 'Marvel-Quiz', imageUrl: "assets/images/Marvel-Quiz.jpg"), // 0
  User(name: 'Anime-zone', imageUrl: 'assets/images/Anime-zone.jpg'), // 1
  User(name: 'Jujutsu Kaisen', imageUrl: 'assets/images/Jujutsu Kaisen.jpg'), // 2
  User(name: 'Kimetsu no Yaibabbbbbbbbbbb', imageUrl: 'assets/images/Kimetsu no Yaiba.jpg'), // 3

];

List<Quiz> quizzes = [
  Quiz(title: 'Qui est Spider-Man', nbQuestion: 12, imageUrl: 'assets/images/Spider-Man PS4.jpg', user: users[0], id: '1'),
  Quiz(title: 'Les transformations de Luffy', nbQuestion: 17, imageUrl: 'assets/images/luffy-gears-5.jpg', user: users[1], id: '2'),
  Quiz(title: 'Les pouvoirs de Satori Gojo', nbQuestion: 12, imageUrl: 'assets/images/Jujutsu Kaisen.jpg', user: users[2], id: '3'),
  Quiz(title: 'Kuroko no basket', nbQuestion: 10, imageUrl: 'assets/images/kuroko-no-basket.jpg', user: users[2], id: '4'),
  Quiz(title: 'Les techniques de Gojo', nbQuestion: 20, imageUrl: 'assets/images/satoru-gojo.png', user: users[0], id: '5'),
  Quiz(title: 'Capitain America', nbQuestion: 12, imageUrl: 'assets/images/capitain-america.jpg', user: users[1], id: '6'),
  Quiz(title: 'Demon Slayer', nbQuestion: 12, imageUrl: 'assets/images/tanjiro.jpg', user: users[2], id: '7'),

  Quiz(title: 'Qui est Spider-Man', nbQuestion: 12, imageUrl: 'assets/images/Spider-Man PS4.jpg', user: users[3], id: '8'),
  Quiz(title: 'Les transformations de Luffy', nbQuestion: 17, imageUrl: 'assets/images/luffy-gears-5.jpg', user: users[0], id: '9'),
  Quiz(title: 'Les pouvoirs de Satori Gojo', nbQuestion: 12, imageUrl: 'assets/images/Jujutsu Kaisen.jpg', user: users[1], id: '10'),
  Quiz(title: 'Kuroko no basket', nbQuestion: 10, imageUrl: 'assets/images/kuroko-no-basket.jpg', user: users[2], id: '11'),
  Quiz(title: 'Les techniques de Gojo', nbQuestion: 20, imageUrl: 'assets/images/satoru-gojo.png', user: users[3], id: '12'),
  Quiz(title: 'Capitain America', nbQuestion: 12, imageUrl: 'assets/images/capitain-america.jpg', user: users[0], id: '13'),
  Quiz(title: 'Demon Slayer', nbQuestion: 12, imageUrl: 'assets/images/tanjiro.jpg', user: users[1], id: '14'),

];