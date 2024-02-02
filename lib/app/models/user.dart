// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? address;
  String? city;
  String? country;
  String? name;
  String? phone;
  String? zipCode;
  int? currentTradesCount;
  int? leverage;
  int? totalTradesCount;
  int? type;
  int? verificationLevel;
  int? currency;
  double? currentTradesVolume;
  double? equity;
  double? freeMargin;
  double? totalTradesVolume;
  bool? isAnyOpenTrades;
  bool? isSwapFree;
  double? balance;
  UserModel({
    this.address,
    this.city,
    this.country,
    this.name,
    this.phone,
    this.zipCode,
    this.currentTradesCount,
    this.leverage,
    this.totalTradesCount,
    this.type,
    this.verificationLevel,
    this.currency,
    this.currentTradesVolume,
    this.equity,
    this.freeMargin,
    this.totalTradesVolume,
    this.isAnyOpenTrades,
    this.isSwapFree,
    this.balance,
  });

  UserModel copyWith({
    String? address,
    String? city,
    String? country,
    String? name,
    String? phone,
    String? zipCode,
    int? currentTradesCount,
    int? leverage,
    int? totalTradesCount,
    int? type,
    int? verificationLevel,
    int? currency,
    double? currentTradesVolume,
    double? equity,
    double? freeMargin,
    double? totalTradesVolume,
    bool? isAnyOpenTrades,
    bool? isSwapFree,
    double? balance,
  }) {
    return UserModel(
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      zipCode: zipCode ?? this.zipCode,
      currentTradesCount: currentTradesCount ?? this.currentTradesCount,
      leverage: leverage ?? this.leverage,
      totalTradesCount: totalTradesCount ?? this.totalTradesCount,
      type: type ?? this.type,
      verificationLevel: verificationLevel ?? this.verificationLevel,
      currency: currency ?? this.currency,
      currentTradesVolume: currentTradesVolume ?? this.currentTradesVolume,
      equity: equity ?? this.equity,
      freeMargin: freeMargin ?? this.freeMargin,
      totalTradesVolume: totalTradesVolume ?? this.totalTradesVolume,
      isAnyOpenTrades: isAnyOpenTrades ?? this.isAnyOpenTrades,
      isSwapFree: isSwapFree ?? this.isSwapFree,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'city': city,
      'country': country,
      'name': name,
      'phone': phone,
      'zipCode': zipCode,
      'currentTradesCount': currentTradesCount,
      'leverage': leverage,
      'totalTradesCount': totalTradesCount,
      'type': type,
      'verificationLevel': verificationLevel,
      'currency': currency,
      'currentTradesVolume': currentTradesVolume,
      'equity': equity,
      'freeMargin': freeMargin,
      'totalTradesVolume': totalTradesVolume,
      'isAnyOpenTrades': isAnyOpenTrades,
      'isSwapFree': isSwapFree,
      'balance': balance,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      address: map['address'] != null ? map['address'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      zipCode: map['zipCode'] != null ? map['zipCode'] as String : null,
      currentTradesCount: map['currentTradesCount'] != null
          ? map['currentTradesCount'] as int
          : null,
      leverage: map['leverage'] != null ? map['leverage'] as int : null,
      totalTradesCount: map['totalTradesCount'] != null
          ? map['totalTradesCount'] as int
          : null,
      type: map['type'] != null ? map['type'] as int : null,
      verificationLevel: map['verificationLevel'] != null
          ? map['verificationLevel'] as int
          : null,
      currency: map['currency'] != null ? map['currency'] as int : null,
      currentTradesVolume: map['currentTradesVolume'] != null
          ? map['currentTradesVolume'] as double
          : null,
      equity: map['equity'] != null ? map['equity'] as double : null,
      freeMargin:
          map['freeMargin'] != null ? map['freeMargin'] as double : null,
      totalTradesVolume: map['totalTradesVolume'] != null
          ? map['totalTradesVolume'] as double
          : null,
      isAnyOpenTrades: map['isAnyOpenTrades'] != null
          ? map['isAnyOpenTrades'] as bool
          : null,
      isSwapFree: map['isSwapFree'] != null ? map['isSwapFree'] as bool : null,
      balance: map['balance'] != null ? map['balance'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(address: $address, city: $city, country: $country, name: $name, phone: $phone, zipCode: $zipCode, currentTradesCount: $currentTradesCount, leverage: $leverage, totalTradesCount: $totalTradesCount, type: $type, verificationLevel: $verificationLevel, currency: $currency, currentTradesVolume: $currentTradesVolume, equity: $equity, freeMargin: $freeMargin, totalTradesVolume: $totalTradesVolume, isAnyOpenTrades: $isAnyOpenTrades, isSwapFree: $isSwapFree, balance: $balance)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.city == city &&
        other.country == country &&
        other.name == name &&
        other.phone == phone &&
        other.zipCode == zipCode &&
        other.currentTradesCount == currentTradesCount &&
        other.leverage == leverage &&
        other.totalTradesCount == totalTradesCount &&
        other.type == type &&
        other.verificationLevel == verificationLevel &&
        other.currency == currency &&
        other.currentTradesVolume == currentTradesVolume &&
        other.equity == equity &&
        other.freeMargin == freeMargin &&
        other.totalTradesVolume == totalTradesVolume &&
        other.isAnyOpenTrades == isAnyOpenTrades &&
        other.isSwapFree == isSwapFree &&
        other.balance == balance;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        city.hashCode ^
        country.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        zipCode.hashCode ^
        currentTradesCount.hashCode ^
        leverage.hashCode ^
        totalTradesCount.hashCode ^
        type.hashCode ^
        verificationLevel.hashCode ^
        currency.hashCode ^
        currentTradesVolume.hashCode ^
        equity.hashCode ^
        freeMargin.hashCode ^
        totalTradesVolume.hashCode ^
        isAnyOpenTrades.hashCode ^
        isSwapFree.hashCode ^
        balance.hashCode;
  }
}
