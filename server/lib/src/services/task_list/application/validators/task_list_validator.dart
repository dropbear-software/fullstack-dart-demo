import 'package:todart_api/api_server.dart' show TaskList;

extension TaskListValidator on TaskList {
  void validate() {
    _ensureValidTitle();
  }

  void _ensureValidTitle() {
    if (title.isEmpty) {
      throw ArgumentError.notNull('title');
    }
  }
}
