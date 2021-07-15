import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/earth_quake_model_mock.dart';

void main() {
  test('earth quake model should be a subclass of earth wuake entity', () {
    expect(tEarthQuakeModelMock, isA<EarthQuakeEntity>());
  });
}
