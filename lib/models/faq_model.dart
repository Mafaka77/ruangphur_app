class FaqModel {
  final String id;
  final String question;
  final String answer;
  final int v;

  FaqModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.v,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json['_id'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
      v: json['__v'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "question": question,
      "answer": answer,
      "__v": v,
    };
  }

  // Parse a list of constituencies from JSON
  static List<FaqModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => FaqModel.fromJson(json)).toList();
  }
}
