import 'package:medcheck/features/home/domain/entities/pack_entity.dart';

class PackModel extends PackEntity {
  const PackModel({
    required super.expiry,
    required super.brandName,
    required super.nafdac,
    required super.description,
    required super.manufacturer,
    required super.verificationCode,
    required super.noOfSachets,
    required super.packId,
    required super.genericName,
    required super.history, required super.verificationCount,
  });

  factory PackModel.fromJson(Map<String, dynamic> json) {

    final drug = json['drug'] ?? {};
    final batch = json['batch'] ?? {};
    final pack = json['pack'] ?? {};
    final sachet = json['sachet'] ?? {};

    return PackModel(
      expiry: batch['expiryDate']?.toString() ?? 'N/A',
      brandName: drug['brandName']?.toString() ?? 'Unknown',
      nafdac: drug['nafdac']?.toString() ?? '',
      description: drug['description']?.toString() ?? '',
      manufacturer: drug['manufacturer']?.toString() ?? '',
      verificationCode: pack['verificationCode']?.toString() ?? '',

      noOfSachets: sachet['noOfSachets'] is int
          ? sachet['noOfSachets']
          : int.tryParse(sachet['noOfSachets']?.toString() ?? '0') ?? 0,

      packId: pack['packId']?.toString() ?? '',
      genericName: drug['genericName']?.toString() ?? '',


      history: (json['history'] as List?)?.map((e) => e.toString()).toList() ?? [],
      verificationCount: pack['verificationCount'] ?? '0',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'batch': {
        'expiryDate': expiry,
      },
      'drug': {
        'brandName': brandName,
        'nafdac': nafdac,
        'description': description,
        'manufacturer': manufacturer,
        'genericName': genericName,
      },
      'pack': {
        'packId': packId,
        'verificationCode': verificationCode,
        'verificationCount': verificationCount
      },
      'sachet': {
        'noOfSachets': noOfSachets.toString(),
      },
      'history': history,
    };
  }
}