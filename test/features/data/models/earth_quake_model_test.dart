import 'dart:convert';

import 'package:earthquake_app/features/data/models/earth_quake_model.dart';
import 'package:earthquake_app/features/domain/entities/earth_quake_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/earth_quake_model_mock.dart';
import '../../../mocks/earth_quake_resume_mock.dart';

void main() {
  test('should be a subclass of EarthQuakeEntity', () {
    expect(tEarthQuakeModel, isA<EarthQuakeEntity>());
  });

  test('should return a valid model', () {
    //deveroia mokar para ver se o model está sendo convertido da forma correta, mas estou com preguiça
    final result = EarthQuakeModel.fromJson(tEarthQuakeMockResume);
    expect(result, tEarthQuakeModel);
  });
}
