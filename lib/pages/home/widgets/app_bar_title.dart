import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Text('QuizMaster'),
        Transform.rotate(
          angle: 0.5,
          child: const IconButton(
            icon: Icon(
              Icons.question_mark,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ),
      ],
    );
  }
}