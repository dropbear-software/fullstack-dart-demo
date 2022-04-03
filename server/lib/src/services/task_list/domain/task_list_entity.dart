import '../../../extractable/domain_event.dart';
import '../../../extractable/entity_identifier.dart';

class TaskListEntity {
  late final EntityIdentifier id;
  final List<DomainEvent> _events = [];

  TaskListEntity();
}
