import 'package:flutter/material.dart';
import '../models/tasks_suggetions.dart';

class ImcSuggestionBox extends StatelessWidget {
  final String? imcCategory;

  const ImcSuggestionBox({
    super.key,
    required this.imcCategory,
  });

  @override
  Widget build(BuildContext context) {
    final tasksSuggestions = TasksSuggestions();

    return Center(
      child: Container(
        constraints: const BoxConstraints(), // Remove restrições de altura
        child: imcCategory == null
            ? Text(
                'Calcule seu IMC para ver sugestões de tarefas.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Text(
                tasksSuggestions.getRandomSuggestion(imcCategory!),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
      ),
    );
  }
}
