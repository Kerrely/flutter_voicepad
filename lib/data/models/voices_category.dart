class VoicesCategory {
  final String title;
  final String identifier;
  final VoicesCategoryType type;

  VoicesCategory({
    required this.title,
    required this.identifier,
    required this.type,
  });
}

enum VoicesCategoryType {
  custom,
  preset,
}
