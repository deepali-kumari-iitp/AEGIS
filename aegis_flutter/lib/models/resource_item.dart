enum ResourceType {
  water,
  food,
  medicine,
  shelter,
  tools,
  people,
}

class ResourceItem {
  final String id;

  final String ownerId;

  final ResourceType type;

  final String title;

  final String description;

  final int quantity;

  final double latitude;

  final double longitude;

  final DateTime createdAt;

  final DateTime expiresAt;

  const ResourceItem({
    required this.id,
    required this.ownerId,
    required this.type,
    required this.title,
    required this.description,
    required this.quantity,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.expiresAt,
  });
}