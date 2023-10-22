import 'package:stacked/stacked.dart';

class NotesViewModel extends BaseViewModel {
  double containerHeight = 150.0; // Initial height of the container
  double screenHeight = 0.0; // Sc
  String _textTitle = '';
  String _textBody = '';

  set updateTextTitle(String value) {
    _textTitle = value;
    rebuildUi();
  }

  set updateTextBody(String value) {
    _textBody = value;
    rebuildUi();
  }

  set updateContainerHeight(double value) {
    if (containerHeight >= 150) {
      containerHeight -= value;
      print(containerHeight);
    } else {
      containerHeight = 150.0;
    }
    rebuildUi();
  }

  bool disableButton() {
    return _textBody.isEmpty ? true : false;
  }
}
