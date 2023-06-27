import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CpRecord extends FirestoreRecord {
  CpRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  bool hasCodigo() => _codigo != null;

  // "mnpio" field.
  String? _mnpio;
  String get mnpio => _mnpio ?? '';
  bool hasMnpio() => _mnpio != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _codigo = snapshotData['codigo'] as String?;
    _mnpio = snapshotData['mnpio'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cp');

  static Stream<CpRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CpRecord.fromSnapshot(s));

  static Future<CpRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CpRecord.fromSnapshot(s));

  static CpRecord fromSnapshot(DocumentSnapshot snapshot) => CpRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CpRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CpRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CpRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CpRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCpRecordData({
  String? name,
  String? codigo,
  String? mnpio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'codigo': codigo,
      'mnpio': mnpio,
    }.withoutNulls,
  );

  return firestoreData;
}
