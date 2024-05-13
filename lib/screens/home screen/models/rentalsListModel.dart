

import 'dart:convert';

List<RentalsListModel> rentalsModelFromJson(String str) => List<RentalsListModel>.from(json.decode(str).map((x) => RentalsListModel.fromJson(x)));

String rentalsModelToJson(List<RentalsListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RentalsListModel {
    final String? title;
    final String? address;
    final String? city;
    final String? rentalPerNight;
    final String? bedrooms;
    final String? bathrooms;
    final bool? petsAllowed;
    final bool? parkingAvailable;
    final String? description;
    final String? landlordName;
    final String? landlordPhone;
    final DateTime? availableFrom;
    final DateTime? availableUntil;
    final bool? fullSlotBooked;
    final String? rentSpaceImg;
    final bool? shortStay;
    final int? slotRent;
    final String? propertyId;
    final List<dynamic>? bookedDates;

    RentalsListModel({
        this.title,
        this.address,
        this.city,
        this.rentalPerNight,
        this.bedrooms,
        this.bathrooms,
        this.petsAllowed,
        this.parkingAvailable,
        this.description,
        this.landlordName,
        this.landlordPhone,
        this.availableFrom,
        this.availableUntil,
        this.fullSlotBooked,
        this.rentSpaceImg,
        this.shortStay,
        this.slotRent,
        this.propertyId,
        this.bookedDates,
    });

    factory RentalsListModel.fromJson(Map<String, dynamic> json) => RentalsListModel(
        title: json["title"],
        address: json["address"],
        city: json["city"],
        rentalPerNight: json["rental_per_night"],
        bedrooms: json["bedrooms"],
        bathrooms: json["bathrooms"],
        petsAllowed: json["pets_allowed"],
        parkingAvailable: json["parking_available"],
        description: json["description"],
        landlordName: json["landlord_name"],
        landlordPhone: json["landlord_phone"],
        availableFrom: json["available_from"] == null ? null : DateTime.parse(json["available_from"]),
        availableUntil: json["available_until"] == null ? null : DateTime.parse(json["available_until"]),
        fullSlotBooked: json["full_slot_booked"],
        rentSpaceImg: json["rent_space_img"],
        shortStay: json["short_stay"],
        slotRent: json["slot_rent"],
        propertyId: json["property_id"],
        bookedDates: json["booked_dates"] == null ? [] : List<dynamic>.from(json["booked_dates"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "address": address,
        "city": city,
        "rental_per_night": rentalPerNight,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "pets_allowed": petsAllowed,
        "parking_available": parkingAvailable,
        "description": description,
        "landlord_name": landlordName,
        "landlord_phone": landlordPhone,
        "available_from": availableFrom?.toIso8601String(),
        "available_until": availableUntil?.toIso8601String(),
        "full_slot_booked": fullSlotBooked,
        "rent_space_img": rentSpaceImg,
        "short_stay": shortStay,
        "slot_rent": slotRent,
        "property_id": propertyId,
        "booked_dates": bookedDates == null ? [] : List<dynamic>.from(bookedDates!.map((x) => x)),
    };
}
