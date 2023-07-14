import 'dart:async';

class ApiLoaderStream {
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  final apiLoaderStream = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => apiLoaderStream.stream;

  bool showLoader = false;

  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    apiLoaderStream.close(); // close our StreamController
  }

  void updateLoader(bool value) {
    showLoader = value;
    apiLoaderStream.sink.add(showLoader);
  }

  static final apiLoaderBloc = ApiLoaderStream();
}
