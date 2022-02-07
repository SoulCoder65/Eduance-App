class QuizModel {
  List<Questions>? questions;

  QuizModel({this.questions});

  QuizModel.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? questionTitle;
  List<String>? questionOptions;
  int? correctOption;

  Questions({this.questionTitle, this.questionOptions, this.correctOption});

  Questions.fromJson(Map<String, dynamic> json) {
    questionTitle = json['question_title'];
    questionOptions = json['question_options'].cast<String>();
    correctOption = json['correct_option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_title'] = this.questionTitle;
    data['question_options'] = this.questionOptions;
    data['correct_option'] = this.correctOption;
    return data;
  }
}
