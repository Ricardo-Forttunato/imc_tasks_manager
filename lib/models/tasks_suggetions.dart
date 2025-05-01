import 'dart:math';

class TasksSuggestions {
  final Map<String, List<String>> suggestions = {
    'Abaixo do peso': [
      'Consultar um nutricionista',
      'Iniciar uma dieta balanceada',
      'Praticar exercícios leves como yoga ou caminhada',
    ],
    'Peso ideal': [
      'Manter uma rotina de exercícios',
      'Continuar com uma alimentação saudável',
      'Realizar check-ups regulares',
    ],
    'Levemente acima do peso': [
      'Reduzir o consumo de alimentos processados',
      'Aumentar a prática de exercícios físicos',
      'Consultar um nutricionista para ajustes na dieta',
    ],
    'Obesidade Grau I': [
      'Iniciar um programa de perda de peso supervisionado',
      'Praticar exercícios aeróbicos regularmente',
      'Consultar um médico para avaliação de saúde',
    ],
    'Obesidade Grau II': [
      'Participar de grupos de apoio para perda de peso',
      'Consultar um endocrinologista',
      'Adotar uma dieta com restrição calórica',
    ],
    'Obesidade Grau III': [
      'Buscar acompanhamento médico especializado',
      'Considerar terapias comportamentais',
      'Praticar atividades físicas adaptadas',
    ],
  };

  String getRandomSuggestion(String imcCategory) {
    final categorySuggestions = suggestions[imcCategory] ?? [];
    if (categorySuggestions.isEmpty) return 'Sem sugestões disponíveis.';
    final randomIndex = Random().nextInt(categorySuggestions.length);
    return categorySuggestions[randomIndex];
  }
}
