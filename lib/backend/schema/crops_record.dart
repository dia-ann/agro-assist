import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CropsRecord extends FirestoreRecord {
  CropsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "min_temp" field.
  double? _minTemp;
  double get minTemp => _minTemp ?? 0.0;
  bool hasMinTemp() => _minTemp != null;

  // "max_temp" field.
  double? _maxTemp;
  double get maxTemp => _maxTemp ?? 0.0;
  bool hasMaxTemp() => _maxTemp != null;

  // "min_rainfall" field.
  double? _minRainfall;
  double get minRainfall => _minRainfall ?? 0.0;
  bool hasMinRainfall() => _minRainfall != null;

  // "max_rainfall" field.
  double? _maxRainfall;
  double get maxRainfall => _maxRainfall ?? 0.0;
  bool hasMaxRainfall() => _maxRainfall != null;

  // "min_humidity" field.
  double? _minHumidity;
  double get minHumidity => _minHumidity ?? 0.0;
  bool hasMinHumidity() => _minHumidity != null;

  // "max_humidity" field.
  double? _maxHumidity;
  double get maxHumidity => _maxHumidity ?? 0.0;
  bool hasMaxHumidity() => _maxHumidity != null;

  // "season" field.
  String? _season;
  String get season => _season ?? '';
  bool hasSeason() => _season != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "risk_solution" field.
  String? _riskSolution;
  String get riskSolution => _riskSolution ?? '';
  bool hasRiskSolution() => _riskSolution != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _minTemp = castToType<double>(snapshotData['min_temp']);
    _maxTemp = castToType<double>(snapshotData['max_temp']);
    _minRainfall = castToType<double>(snapshotData['min_rainfall']);
    _maxRainfall = castToType<double>(snapshotData['max_rainfall']);
    _minHumidity = castToType<double>(snapshotData['min_humidity']);
    _maxHumidity = castToType<double>(snapshotData['max_humidity']);
    _season = snapshotData['season'] as String?;
    _type = snapshotData['type'] as String?;
    _riskSolution = snapshotData['risk_solution'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('crops');

  static Stream<CropsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CropsRecord.fromSnapshot(s));

  static Future<CropsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CropsRecord.fromSnapshot(s));

  static CropsRecord fromSnapshot(DocumentSnapshot snapshot) => CropsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CropsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CropsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CropsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CropsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCropsRecordData({
  String? name,
  double? minTemp,
  double? maxTemp,
  double? minRainfall,
  double? maxRainfall,
  double? minHumidity,
  double? maxHumidity,
  String? season,
  String? type,
  String? riskSolution,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'min_temp': minTemp,
      'max_temp': maxTemp,
      'min_rainfall': minRainfall,
      'max_rainfall': maxRainfall,
      'min_humidity': minHumidity,
      'max_humidity': maxHumidity,
      'season': season,
      'type': type,
      'risk_solution': riskSolution,
    }.withoutNulls,
  );

  return firestoreData;
}

class CropsRecordDocumentEquality implements Equality<CropsRecord> {
  const CropsRecordDocumentEquality();

  @override
  bool equals(CropsRecord? e1, CropsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.minTemp == e2?.minTemp &&
        e1?.maxTemp == e2?.maxTemp &&
        e1?.minRainfall == e2?.minRainfall &&
        e1?.maxRainfall == e2?.maxRainfall &&
        e1?.minHumidity == e2?.minHumidity &&
        e1?.maxHumidity == e2?.maxHumidity &&
        e1?.season == e2?.season &&
        e1?.type == e2?.type &&
        e1?.riskSolution == e2?.riskSolution;
  }

  @override
  int hash(CropsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.minTemp,
        e?.maxTemp,
        e?.minRainfall,
        e?.maxRainfall,
        e?.minHumidity,
        e?.maxHumidity,
        e?.season,
        e?.type,
        e?.riskSolution
      ]);

  @override
  bool isValidKey(Object? o) => o is CropsRecord;
}
