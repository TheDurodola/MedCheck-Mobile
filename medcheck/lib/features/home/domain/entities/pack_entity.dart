import 'package:equatable/equatable.dart';

class PackEntity extends Equatable {
  final String expiry;
  final String brandName;
  final String nafdac;
  final String description;
  final String manufacturer;
  final String verificationCode;
  final String verificationCount;
  final int noOfSachets;
  final String packId;
  final String genericName;
  final List<String> history;

  const PackEntity({
    required this.expiry,
    required this.brandName,
    required this.nafdac,
    required this.description,
    required this.manufacturer,
    required this.verificationCode,
    required this.noOfSachets,
    required this.packId,
    required this.genericName,
    required this.history,
    required this.verificationCount,
  });

  @override
  List<Object?> get props => [
    expiry,
    brandName,
    nafdac,
    description,
    history,
    manufacturer,
    verificationCode,
    noOfSachets,
    genericName,
    packId,
    verificationCount
  ];
}
