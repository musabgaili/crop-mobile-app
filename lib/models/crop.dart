class Crop {
  const Crop(
      {key,
      required this.name,
      required this.date,
      required this.quantity,
      required this.price});

  final String name;
  final String date;
  final int quantity;
  final double price;
}
