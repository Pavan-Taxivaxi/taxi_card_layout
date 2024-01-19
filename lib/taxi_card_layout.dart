library taxi_card_layout;

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:taxi_card_layout/taxi_booking.dart';
import 'package:taxi_card_layout/tv_theme.dart';

import 'constants.dart';


Widget taxiCardLayout(BuildContext context,var data ){

  List<CoPassenger> passengerList =[];
  for(int i=0;i<data.coPassengers.length;i++){
    passengerList.add(
        CoPassenger(
            peopleName: data.coPassengers[i].peopleName,
            peopleContact: data.coPassengers[i].peopleContact,
            peopleCid: data.coPassengers[i].peopleCid,
            peopleEmail: data.coPassengers[i].peopleEmail,
        )
    );
  }
  TaxiBooking taxiBooking = TaxiBooking(
    referenceNo: data.referenceNo,
    tourType: data.tourType,
    assessmentCode: data.assessmentCode,
    pickupDatetime: data.pickupDatetime,
    pickupLocation: data.pickupLocation,
    statusTv: data.statusTv,
    statusCompany: data.statusCompany,
    coPassengers: passengerList,
  );

  DateTime formattedDate(String strDate){
    DateTime formatter = DateFormat('dd MMM yyyy - HH:mm a').parse(strDate);
    DateTime inputDate = DateTime.parse(formatter.toString());
    return inputDate;
  }
  String formattedMonth(DateTime dateTime){
    String formatter= DateFormat("MMM").format(dateTime) ;
    return formatter;
  }

  showEmployeeDetails(List<CoPassenger>? people){
    showDialog(context: context, builder: (BuildContext buContext){
      return AlertDialog(
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(
                          alignment: Alignment.center,
                          child: Text("Employee Details",style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 20),))),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: (){Navigator.pop(context);},
                          icon: const Icon(Icons.cancel_outlined)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: people!.length,
                    itemBuilder: (BuildContext context,int index){
                      return ListTile(
                        trailing: IconButton(
                          icon: const Icon(Icons.call,color: Colors.green,),
                          onPressed: ()async{
                             await FlutterPhoneDirectCaller.callNumber(people[index].peopleContact.toString());
                          },
                        ),
                        subtitle: Text("${people[index].peopleContact}\n${people[index].peopleEmail}"),
                        title: Text(people[index].peopleName!,style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      );
    });
  }


  return Card(
    elevation: 5,
    surfaceTintColor: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: Constants.taxiCardTop,
          color: TVTheme.blackColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(taxiBooking.referenceNo.toString(),style: GoogleFonts.lato(fontSize: Constants.subHeader, fontWeight: FontWeight.w600,color: TVTheme.primaryColor),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(taxiBooking.tourType.toString(),style: GoogleFonts.lato(fontSize: Constants.subHeader,fontWeight: FontWeight.w600,color: TVTheme.primaryColor),),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text("Assessment Code - ${taxiBooking.assessmentCode.toString()}",style: GoogleFonts.lato(fontSize: Constants.subHeader,fontWeight: FontWeight.w500,color: TVTheme.blackColor)),
        ),
        const Divider(height: 2),
        Padding(
          padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text("${formattedDate(taxiBooking.pickupDatetime!).day}",style: GoogleFonts.ubuntu(fontWeight: FontWeight.w700,fontSize: Constants.title),),
                    Text("${formattedMonth(formattedDate(taxiBooking.pickupDatetime!))} ${formattedDate(taxiBooking.pickupDatetime!).year}",style: GoogleFonts.ubuntu(fontWeight: FontWeight.w700,fontSize: Constants.subHeader),),
                    Text(DateFormat.jm().format(formattedDate(taxiBooking.pickupDatetime!)),style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500,fontSize: Constants.subHeader),),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(FontAwesomeIcons.locationDot,size: Constants.iconSizeCard,color: TVTheme.secondColor,),
                        Expanded(child: Text(" ${taxiBooking.pickupLocation.toString()} ",overflow: TextOverflow.ellipsis,maxLines: 1,style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: Constants.subHeader),)),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.locationArrow,size:Constants.iconSizeCard,color: TVTheme.secondColor,),
                        Expanded(
                            child: Text(
                              taxiBooking.dropLocation.toString() ==""?" N/A ": " ${taxiBooking.pickupLocation.toString()} ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: Constants.subHeader),)),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 2,),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          alignment:Alignment.topLeft,
                          child: Text(
                              "Approver",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Constants.subHeader
                              )
                          )
                      )),
                  Expanded(
                      flex: 4,
                      child: Container(
                          alignment:Alignment.topLeft,
                          child: Text(
                              taxiBooking.statusCompany.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Constants.subHeader
                              )
                          )
                      )
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 3,
              child:
              passengerList.isEmpty?
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "No Co-passengers",
                    style: GoogleFonts.lato(fontSize: Constants.subHeader),
                  )
              ):
              GestureDetector(
                onTap: (){
                  showEmployeeDetails(passengerList);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            alignment:Alignment.topLeft,
                            child: Text(
                              "People",
                              style: GoogleFonts.lato(fontSize: Constants.subHeader),
                            )
                        )
                    ),
                    Expanded(
                        flex: 4,
                        child: Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(right: 5),
                                alignment:Alignment.topLeft,
                                child: Text(
                                    taxiBooking.coPassengers!.length.toString(),
                                    style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: Constants.subHeader)
                                )
                            ),

                            Icon(Icons.info_outline,size: Constants.iconSizeCard,)
                          ],
                        )
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          alignment:Alignment.topLeft,
                          child: Text(
                              "Taxivaxi",
                              style: GoogleFonts.lato(fontSize: Constants.subHeader)
                          )
                      )
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                          alignment:Alignment.topLeft,
                          child: Text(
                              taxiBooking.statusTv.toString(),
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Constants.subHeader
                              )
                          )
                      )
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          alignment:Alignment.topLeft,
                          child: Text(
                              "SPOC",
                              style: GoogleFonts.lato(fontSize: Constants.subHeader)
                          )
                      )),
                  Expanded(
                      flex: 4,
                      child: Container(
                          alignment:Alignment.topLeft,
                          child: const Text(
                              "Spoc Name"
                          )
                      )
                  )

                ],
              ),
            ),

          ],
        ),

      ],
    ),
  );
}