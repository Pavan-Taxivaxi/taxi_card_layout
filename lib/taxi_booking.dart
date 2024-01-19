
class TaxiBooking {
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

  TaxiBooking({
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


}

class DriverDetails {
  String? driverName;
  String? driverContact;

  DriverDetails({
    this.driverName,
    this.driverContact,
  });


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


}

class TaxiDetails {
  dynamic taxiModelName;
  String? taxiRegNo;

  TaxiDetails({
    this.taxiModelName,
    this.taxiRegNo,
  });


}