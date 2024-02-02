import 'dart:convert';

class OpenTradeModel {
  String? comment;
  String? openTime;
  String? symbol;
  int? digits;
  int? login;
  int? ticket;
  int? type;
  double? openPrice;
  double? profit;
  double? sl;
  double? swaps;
  double? tp;
  double? currentPrice;
  double? volume;
  OpenTradeModel({
    this.comment,
    this.openTime,
    this.symbol,
    this.digits,
    this.login,
    this.ticket,
    this.type,
    this.openPrice,
    this.profit,
    this.sl,
    this.swaps,
    this.tp,
    this.currentPrice,
    this.volume,
  });

  OpenTradeModel copyWith({
    String? comment,
    String? openTime,
    String? symbol,
    int? digits,
    int? login,
    int? ticket,
    int? type,
    double? openPrice,
    double? profit,
    double? sl,
    double? swaps,
    double? tp,
    double? currentPrice,
    double? volume,
  }) {
    return OpenTradeModel(
      comment: comment ?? this.comment,
      openTime: openTime ?? this.openTime,
      symbol: symbol ?? this.symbol,
      digits: digits ?? this.digits,
      login: login ?? this.login,
      ticket: ticket ?? this.ticket,
      type: type ?? this.type,
      openPrice: openPrice ?? this.openPrice,
      profit: profit ?? this.profit,
      sl: sl ?? this.sl,
      swaps: swaps ?? this.swaps,
      tp: tp ?? this.tp,
      currentPrice: currentPrice ?? this.currentPrice,
      volume: volume ?? this.volume,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'comment': comment,
      'openTime': openTime,
      'symbol': symbol,
      'digits': digits,
      'login': login,
      'ticket': ticket,
      'type': type,
      'openPrice': openPrice,
      'profit': profit,
      'sl': sl,
      'swaps': swaps,
      'tp': tp,
      'currentPrice': currentPrice,
      'volume': volume,
    };
  }

  factory OpenTradeModel.fromMap(Map<String, dynamic> map) {
    return OpenTradeModel(
      comment: map['comment'] != null ? map['comment'] as String : null,
      openTime: map['openTime'] != null ? map['openTime'] as String : null,
      symbol: map['symbol'] != null ? map['symbol'] as String : null,
      digits: map['digits'] != null ? map['digits'] as int : null,
      login: map['login'] != null ? map['login'] as int : null,
      ticket: map['ticket'] != null ? map['ticket'] as int : null,
      type: map['type'] != null ? map['type'] as int : null,
      openPrice: map['openPrice'] != null ? map['openPrice'] as double : null,
      profit: map['profit'] != null ? map['profit'] as double : null,
      sl: map['sl'] != null ? map['sl'] as double : null,
      swaps: map['swaps'] != null ? map['swaps'] as double : null,
      tp: map['tp'] != null ? map['tp'] as double : null,
      currentPrice:
          map['currentPrice'] != null ? map['currentPrice'] as double : null,
      volume: map['volume'] != null ? map['volume'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OpenTradeModel.fromJson(String source) =>
      OpenTradeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OpenTradeModel(comment: $comment, openTime: $openTime, symbol: $symbol, digits: $digits, login: $login, ticket: $ticket, type: $type, openPrice: $openPrice, profit: $profit, sl: $sl, swaps: $swaps, tp: $tp, currentPrice: $currentPrice, volume: $volume)';
  }

  @override
  bool operator ==(covariant OpenTradeModel other) {
    if (identical(this, other)) return true;

    return other.comment == comment &&
        other.openTime == openTime &&
        other.symbol == symbol &&
        other.digits == digits &&
        other.login == login &&
        other.ticket == ticket &&
        other.type == type &&
        other.openPrice == openPrice &&
        other.profit == profit &&
        other.sl == sl &&
        other.swaps == swaps &&
        other.tp == tp &&
        other.currentPrice == currentPrice &&
        other.volume == volume;
  }

  @override
  int get hashCode {
    return comment.hashCode ^
        openTime.hashCode ^
        symbol.hashCode ^
        digits.hashCode ^
        login.hashCode ^
        ticket.hashCode ^
        type.hashCode ^
        openPrice.hashCode ^
        profit.hashCode ^
        sl.hashCode ^
        swaps.hashCode ^
        tp.hashCode ^
        currentPrice.hashCode ^
        volume.hashCode;
  }
}
