class TransportFee {
  final bool? success;
  final String? message;
  final Fee? fee;

  TransportFee(
      {required this.success, required this.message, required this.fee});

  factory TransportFee.fromJson(Map<String, dynamic> json) => TransportFee(
        success: json["success"],
        message: json["message"],
        fee: Fee.fromJson(json["fee"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "fee": fee!.toJson(),
      };
}

class Fee {
  final String? name;
  final int? fee;
  final int? insurance_fee;
  final dynamic include_vat;
  final dynamic cost_id;
  final String? delivery_type;
  final String? a;
  final String? dt;
  final List<dynamic>? extFees;
  final int? ship_fee_only;
  final String? promotion_key;
  final double? distance;
  final bool? delivery;

  Fee({
    required this.name,
    required this.fee,
    required this.insurance_fee,
    required this.include_vat,
    required this.cost_id,
    required this.delivery_type,
    required this.a,
    required this.dt,
    required this.extFees,
    required this.ship_fee_only,
    required this.promotion_key,
    required this.distance,
    required this.delivery,
  });

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        name: json["name"],
        fee: json["fee"],
        insurance_fee: json["insurance_fee"],
        include_vat: json["include_vat"],
        cost_id: json["cost_id"],
        delivery_type: json["delivery_type"],
        a: json["a"],
        dt: json["dt"],
        extFees: List<dynamic>.from(json["extFees"].map((x) => x)),
        ship_fee_only: json["ship_fee_only"],
        promotion_key: json["promotion_key"],
        distance: json["distance"],
        delivery: json["delivery"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "fee": fee,
        "insurance_fee": insurance_fee,
        "include_vat": include_vat,
        "cost_id": cost_id,
        "delivery_type": delivery_type,
        "a": a,
        "dt": dt,
        "extFees": List<dynamic>.from(extFees!.map((x) => x)),
        "ship_fee_only": ship_fee_only,
        "promotion_key": promotion_key,
        "distance": distance,
        "delivery": delivery,
      };
}
