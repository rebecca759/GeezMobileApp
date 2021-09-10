import 'package:geezapp/Questions/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object> get props => [];
}

class QuestionLoading extends QuestionState {}

class QuetionOperationSuccess extends QuestionState {
  final Iterable<Questions> question;

  QuetionOperationSuccess([this.question = const []]);

  @override
  List<Object> get props => [question];
}

class QuestionOperationFailure extends QuestionState {}

class QuestionLoadSuccess extends QuestionState {
  final Questions question;

  QuestionLoadSuccess(this.question);

  @override
  List<Object> get props => [question];
}

class QuestionContentOperationSuccess extends QuestionState {
  final String questionContent;

  QuestionContentOperationSuccess([this.questionContent = ""]);

  @override
  List<Object> get props => [questionContent];
}
