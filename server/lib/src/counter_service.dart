import 'package:api_server/src/counter_entity.dart';
import 'package:counter_api/counter_api.dart';
import 'package:grpc/service_api.dart';

class CounterService extends CounterServiceBase {
  late final CounterEntity _counterEntity;

  CounterService(this._counterEntity);

  @override
  Future<Counter> decreaseCount(ServiceCall call, Empty request) {
    final result = _counterEntity.decrement();
    return Future.value(Counter(total: result));
  }

  @override
  Future<Counter> increaseCount(ServiceCall call, Empty request) {
    final result = _counterEntity.increment();
    return Future.value(Counter(total: result));
  }
}
