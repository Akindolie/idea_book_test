import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ideabook/models/idea.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class NotesViewModel extends BaseViewModel {
  double containerHeight = 110.0; // Initial height of the container
  double screenHeight = 0.0; // Sc
  String _textTitle = '';
  String _textBody = '';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  TextEditingController get titleController => _titleController;
  TextEditingController get contentController => _contentController;

  final now = DateTime.now();

  final List<Idea> _ideas = [];

  List<Idea> get ideas => _ideas;

  set updateTextTitle(String value) {
    _textTitle = value;
    rebuildUi();
  }

  set updateTextBody(String value) {
    _textBody = value;
    rebuildUi();
  }

  set updateContainerHeight(double value) {
    if (containerHeight >= 110) {
      containerHeight -= value;
    } else {
      containerHeight = 110.0;
    }
    rebuildUi();
  }

  bool disableButton() {
    return _textBody.isEmpty ? true : false;
  }

  String getCurrentDate() {
    return DateFormat.MMMd().format(now);
  }

  String getCurrentTime() {
    final timeFormatter = DateFormat('h:mm a');
    final formattedTime = timeFormatter.format(now);
    return formattedTime;
  }

  void submit() {
    if (_textBody.length < 20) {
      Fluttertoast.showToast(
          msg: "content must be more than 20 characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      rebuildUi();
    } else {
      var title = _textTitle.isEmpty ? _textBody.substring(0, 20) : _textTitle;
      var idea = Idea(
          title: title,
          content: _textBody,
          date: getCurrentDate(),
          time: getCurrentTime());
      _ideas.add(idea);
      _titleController.clear();
      _contentController.clear();
      _textTitle = '';
      _textBody = '';
      rebuildUi();
    }
  }
}
