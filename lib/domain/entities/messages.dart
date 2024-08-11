enum FromWho { my, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime created;
  final bool read;

  Message(
      {required this.text,
      this.imageUrl,
      required this.fromWho,
      required this.created,
      this.read = false});
}
