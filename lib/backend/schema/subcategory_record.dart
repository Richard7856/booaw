import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubcategoryRecord extends FirestoreRecord {
  SubcategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subcategory');

  static Stream<SubcategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubcategoryRecord.fromSnapshot(s));

  static Future<SubcategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubcategoryRecord.fromSnapshot(s));

  static SubcategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubcategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubcategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubcategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubcategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubcategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubcategoryRecordData({
  String? name,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}
