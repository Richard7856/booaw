import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CetegoRecord extends FirestoreRecord {
  CetegoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _active = snapshotData['active'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cetego');

  static Stream<CetegoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CetegoRecord.fromSnapshot(s));

  static Future<CetegoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CetegoRecord.fromSnapshot(s));

  static CetegoRecord fromSnapshot(DocumentSnapshot snapshot) => CetegoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CetegoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CetegoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CetegoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CetegoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCetegoRecordData({
  String? name,
  bool? active,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'active': active,
    }.withoutNulls,
  );

  return firestoreData;
}
