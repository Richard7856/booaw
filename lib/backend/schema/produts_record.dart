import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutsRecord extends FirestoreRecord {
  ProdutsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "specifications" field.
  String? _specifications;
  String get specifications => _specifications ?? '';
  bool hasSpecifications() => _specifications != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "on_sale" field.
  bool? _onSale;
  bool get onSale => _onSale ?? false;
  bool hasOnSale() => _onSale != null;

  // "sale_price" field.
  double? _salePrice;
  double get salePrice => _salePrice ?? 0.0;
  bool hasSalePrice() => _salePrice != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "vendedor" field.
  String? _vendedor;
  String get vendedor => _vendedor ?? '';
  bool hasVendedor() => _vendedor != null;

  // "vendor" field.
  String? _vendor;
  String get vendor => _vendor ?? '';
  bool hasVendor() => _vendor != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "favorite" field.
  bool? _favorite;
  bool get favorite => _favorite ?? false;
  bool hasFavorite() => _favorite != null;

  // "vendido" field.
  bool? _vendido;
  bool get vendido => _vendido ?? false;
  bool hasVendido() => _vendido != null;

  // "clienteid" field.
  String? _clienteid;
  String get clienteid => _clienteid ?? '';
  bool hasClienteid() => _clienteid != null;

  // "sell_date" field.
  DateTime? _sellDate;
  DateTime? get sellDate => _sellDate;
  bool hasSellDate() => _sellDate != null;

  // "sub_category" field.
  String? _subCategory;
  String get subCategory => _subCategory ?? '';
  bool hasSubCategory() => _subCategory != null;

  // "where_buy" field.
  String? _whereBuy;
  String get whereBuy => _whereBuy ?? '';
  bool hasWhereBuy() => _whereBuy != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _specifications = snapshotData['specifications'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _onSale = snapshotData['on_sale'] as bool?;
    _salePrice = castToType<double>(snapshotData['sale_price']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _image = snapshotData['image'] as String?;
    _vendedor = snapshotData['vendedor'] as String?;
    _vendor = snapshotData['vendor'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _favorite = snapshotData['favorite'] as bool?;
    _vendido = snapshotData['vendido'] as bool?;
    _clienteid = snapshotData['clienteid'] as String?;
    _sellDate = snapshotData['sell_date'] as DateTime?;
    _subCategory = snapshotData['sub_category'] as String?;
    _whereBuy = snapshotData['where_buy'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produts');

  static Stream<ProdutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProdutsRecord.fromSnapshot(s));

  static Future<ProdutsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProdutsRecord.fromSnapshot(s));

  static ProdutsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProdutsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProdutsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProdutsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProdutsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProdutsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProdutsRecordData({
  String? name,
  String? description,
  String? specifications,
  double? price,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? onSale,
  double? salePrice,
  int? quantity,
  String? image,
  String? vendedor,
  String? vendor,
  String? categoria,
  bool? favorite,
  bool? vendido,
  String? clienteid,
  DateTime? sellDate,
  String? subCategory,
  String? whereBuy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'specifications': specifications,
      'price': price,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'on_sale': onSale,
      'sale_price': salePrice,
      'quantity': quantity,
      'image': image,
      'vendedor': vendedor,
      'vendor': vendor,
      'categoria': categoria,
      'favorite': favorite,
      'vendido': vendido,
      'clienteid': clienteid,
      'sell_date': sellDate,
      'sub_category': subCategory,
      'where_buy': whereBuy,
    }.withoutNulls,
  );

  return firestoreData;
}
