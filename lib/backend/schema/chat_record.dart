import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "senderid" field.
  String? _senderid;
  String get senderid => _senderid ?? '';
  bool hasSenderid() => _senderid != null;

  // "reciverid" field.
  String? _reciverid;
  String get reciverid => _reciverid ?? '';
  bool hasReciverid() => _reciverid != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "idchat" field.
  String? _idchat;
  String get idchat => _idchat ?? '';
  bool hasIdchat() => _idchat != null;

  // "vendedor" field.
  String? _vendedor;
  String get vendedor => _vendedor ?? '';
  bool hasVendedor() => _vendedor != null;

  // "comprador" field.
  String? _comprador;
  String get comprador => _comprador ?? '';
  bool hasComprador() => _comprador != null;

  // "idproducto" field.
  String? _idproducto;
  String get idproducto => _idproducto ?? '';
  bool hasIdproducto() => _idproducto != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  bool hasProduct() => _product != null;

  // "idproduct" field.
  String? _idproduct;
  String get idproduct => _idproduct ?? '';
  bool hasIdproduct() => _idproduct != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _senderid = snapshotData['senderid'] as String?;
    _reciverid = snapshotData['reciverid'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _idchat = snapshotData['idchat'] as String?;
    _vendedor = snapshotData['vendedor'] as String?;
    _comprador = snapshotData['comprador'] as String?;
    _idproducto = snapshotData['idproducto'] as String?;
    _name = snapshotData['name'] as String?;
    _product = snapshotData['product'] as DocumentReference?;
    _idproduct = snapshotData['idproduct'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  String? message,
  String? senderid,
  String? reciverid,
  DateTime? time,
  String? idchat,
  String? vendedor,
  String? comprador,
  String? idproducto,
  String? name,
  DocumentReference? product,
  String? idproduct,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'senderid': senderid,
      'reciverid': reciverid,
      'time': time,
      'idchat': idchat,
      'vendedor': vendedor,
      'comprador': comprador,
      'idproducto': idproducto,
      'name': name,
      'product': product,
      'idproduct': idproduct,
    }.withoutNulls,
  );

  return firestoreData;
}
