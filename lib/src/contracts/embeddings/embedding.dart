class Embedding {
  final List<double> values;
  final int dimensions;
  final Map<String, String> metadata;
  const Embedding({
    required this.values,
    required this.dimensions,
    this.metadata = const {},
  });
}
