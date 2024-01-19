
class Booking {
  String? bookingId;
  String? referenceNo;
  String? tourType;
  String? pickupLocation;
  String? dropLocation;
  String? bookingDate;
  String? pickupDatetime;
  DateTime? pDateForSort;
  String? status;
  String? bookingReason;
  String? assessmentCode;
  List<CoPassenger>? coPassengers;
  SpocDetails? spocDetails;
  String? isAssign;
  DriverDetails? driverDetails;
  TaxiDetails? taxiDetails;
  String? statusCompany;
  String? statusTv;
  int? isCancelAllowed;

  Booking({
    this.bookingId,
    this.referenceNo,
    this.tourType,
    this.pickupLocation,
    this.dropLocation,
    this.bookingDate,
    this.pickupDatetime,
    this.pDateForSort,
    this.status,
    this.bookingReason,
    this.assessmentCode,
    this.coPassengers,
    this.spocDetails,
    this.isAssign,
    this.driverDetails,
    this.taxiDetails,
    this.statusCompany,
    this.statusTv,
    this.isCancelAllowed,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    bookingId: json["booking_id"],
    referenceNo: json["reference_no"],
    tourType: json["tour_type"],
    pickupLocation: json["pickup_location"],
    dropLocation: json["drop_location"],
    bookingDate: json["booking_date"],
    pickupDatetime: json["pickup_datetime"],
    pDateForSort: json["p_date_for_sort"] == null ? null : DateTime.parse(json["p_date_for_sort"]),
    status: json["status"],
    bookingReason: json["booking_reason"],
    assessmentCode: json["assessment_code"],
    coPassengers: json["co_passengers"] == null ? [] : List<CoPassenger>.from(json["co_passengers"]!.map((x) => CoPassenger.fromJson(x))),
    spocDetails: json["spoc_details"] == null ? null : SpocDetails.fromJson(json["spoc_details"]),
    isAssign: json["is_assign"],
    driverDetails: json["driver_details"] == null ? null : DriverDetails.fromJson(json["driver_details"]),
    taxiDetails: json["taxi_details"] == null ? null : TaxiDetails.fromJson(json["taxi_details"]),
    statusCompany: json["status_company"],
    statusTv: json["status_tv"],
    isCancelAllowed: json["is_cancel_allowed"],
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
    "reference_no": referenceNo,
    "tour_type": tourType,
    "pickup_location": pickupLocation,
    "drop_location": dropLocation,
    "booking_date": bookingDate,
    "pickup_datetime": pickupDatetime,
    "p_date_for_sort": pDateForSort?.toIso8601String(),
    "status": status,
    "booking_reason": bookingReason,
    "assessment_code": assessmentCode,
    "co_passengers": coPassengers == null ? [] : List<dynamic>.from(coPassengers!.map((x) => x.toJson())),
    "spoc_details": spocDetails?.toJson(),
    "is_assign": isAssign,
    "driver_details": driverDetails?.toJson(),
    "taxi_details": taxiDetails?.toJson(),
    "status_company": statusCompany,
    "status_tv": statusTv,
    "is_cancel_allowed": isCancelAllowed,
  };
}

class CoPassenger {
  String? peopleName;
  String? peopleContact;
  String? peopleCid;
  String? peopleEmail;
  String? hasDummyEmail;

  CoPassenger({
    this.peopleName,
    this.peopleContact,
    this.peopleCid,
    this.peopleEmail,
    this.hasDummyEmail,
  });

  factory CoPassenger.fromJson(Map<String, dynamic> json) => CoPassenger(
    peopleName: json["people_name"],
    peopleContact: json["people_contact"],
    peopleCid: json["people_cid"],
    peopleEmail: json["people_email"],
    hasDummyEmail: json["has_dummy_email"],
  );

  Map<String, dynamic> toJson() => {
    "people_name": peopleName,
    "people_contact": peopleContact,
    "people_cid": peopleCid,
    "people_email": peopleEmail,
    "has_dummy_email": hasDummyEmail,
  };
}

class DriverDetails {
  String? driverName;
  String? driverContact;

  DriverDetails({
    this.driverName,
    this.driverContact,
  });

  factory DriverDetails.fromJson(Map<String, dynamic> json) => DriverDetails(
    driverName: json["driver_name"],
    driverContact: json["driver_contact"],
  );

  Map<String, dynamic> toJson() => {
    "driver_name": driverName,
    "driver_contact": driverContact,
  };
}

class SpocDetails {
  String? spocName;
  String? spocContactEmail;
  String? spocContactNo;

  SpocDetails({
    this.spocName,
    this.spocContactEmail,
    this.spocContactNo,
  });

  factory SpocDetails.fromJson(Map<String, dynamic> json) => SpocDetails(
    spocName: json["spoc_name"],
    spocContactEmail: json["spoc_contact_email"],
    spocContactNo: json["spoc_contact_no"],
  );

  Map<String, dynamic> toJson() => {
    "spoc_name": spocName,
    "spoc_contact_email": spocContactEmail,
    "spoc_contact_no": spocContactNo,
  };
}

class TaxiDetails {
  dynamic taxiModelName;
  String? taxiRegNo;

  TaxiDetails({
    this.taxiModelName,
    this.taxiRegNo,
  });

  factory TaxiDetails.fromJson(Map<String, dynamic> json) => TaxiDetails(
    taxiModelName: json["taxi_model_name"],
    taxiRegNo: json["taxi_reg_no"],
  );

  Map<String, dynamic> toJson() => {
    "taxi_model_name": taxiModelName,
    "taxi_reg_no": taxiRegNo,
  };
}