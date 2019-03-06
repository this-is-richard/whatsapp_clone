import 'dart:math';

String randomImageUrl() {
  final rnd = Random();
  final width = rnd.nextInt(1000);
  final height = rnd.nextInt(1000);

  return 'https://via.placeholder.com/${width < 150 ? width + 150 : width}x${height < 150 ? width + 150 : height}';
}
