// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  LocationModel({
    this.response,
  });

  Response1? response;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    response: Response1.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response!.toJson(),
  };
}

class Response1 {
  Response1({
    this.geoObjectCollection,
  });

  GeoObjectCollection? geoObjectCollection;

  factory Response1.fromJson(Map<String, dynamic> json) => Response1(
    geoObjectCollection: GeoObjectCollection.fromJson(json["GeoObjectCollection"]),
  );

  Map<String, dynamic> toJson() => {
    "GeoObjectCollection": geoObjectCollection!.toJson(),
  };
}

class GeoObjectCollection {
  GeoObjectCollection({
    this.metaDataProperty,
    this.featureMember,
  });

  GeoObjectCollectionMetaDataProperty? metaDataProperty;
  List<FeatureMember>? featureMember;

  factory GeoObjectCollection.fromJson(Map<String, dynamic> json) => GeoObjectCollection(
    metaDataProperty: GeoObjectCollectionMetaDataProperty.fromJson(json["metaDataProperty"]),
    featureMember: List<FeatureMember>.from(json["featureMember"].map((x) => FeatureMember.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "metaDataProperty": metaDataProperty!.toJson(),
    "featureMember": List<dynamic>.from(featureMember!.map((x) => x.toJson())),
  };
}

class FeatureMember {
  FeatureMember({
    this.geoObject,
  });

  GeoObject? geoObject;

  factory FeatureMember.fromJson(Map<String, dynamic> json) => FeatureMember(
    geoObject: GeoObject.fromJson(json["GeoObject"]),
  );

  Map<String, dynamic> toJson() => {
    "GeoObject": geoObject!.toJson(),
  };
}

class GeoObject {
  GeoObject({
    this.metaDataProperty,
    this.name,
    this.description,
    this.boundedBy,
    this.point,
  });

  GeoObjectMetaDataProperty? metaDataProperty;
  String? name;
  Description? description;
  BoundedBy? boundedBy;
  Point? point;

  factory GeoObject.fromJson(Map<String, dynamic> json) => GeoObject(
    metaDataProperty: GeoObjectMetaDataProperty.fromJson(json["metaDataProperty"]),
    name: json["name"],
    description: descriptionValues.map[json["description"]],
    boundedBy: BoundedBy.fromJson(json["boundedBy"]),
    point: Point.fromJson(json["Point"]),
  );

  Map<String, dynamic> toJson() => {
    "metaDataProperty": metaDataProperty!.toJson(),
    "name": name,
    "description": descriptionValues.reverse[description],
    "boundedBy": boundedBy!.toJson(),
    "Point": point!.toJson(),
  };
}

class BoundedBy {
  BoundedBy({
    this.envelope,
  });

  Envelope? envelope;

  factory BoundedBy.fromJson(Map<String, dynamic> json) => BoundedBy(
    envelope: Envelope.fromJson(json["Envelope"]),
  );

  Map<String, dynamic> toJson() => {
    "Envelope": envelope!.toJson(),
  };
}

class Envelope {
  Envelope({
    this.lowerCorner,
    this.upperCorner,
  });

  String? lowerCorner;
  String? upperCorner;

  factory Envelope.fromJson(Map<String, dynamic> json) => Envelope(
    lowerCorner: json["lowerCorner"],
    upperCorner: json["upperCorner"],
  );

  Map<String, dynamic> toJson() => {
    "lowerCorner": lowerCorner,
    "upperCorner": upperCorner,
  };
}

enum Description { CHILONZOR_DAHASI_CHILONZOR_TUMANI_TOSHKENT_O_ZBEKISTON, TOSHKENT_O_ZBEKISTON }

final descriptionValues = EnumValues({
  "Chilonzor dahasi, Chilonzor tumani, Toshkent, Oʻzbekiston": Description.CHILONZOR_DAHASI_CHILONZOR_TUMANI_TOSHKENT_O_ZBEKISTON,
  "Toshkent, Oʻzbekiston": Description.TOSHKENT_O_ZBEKISTON
});

class GeoObjectMetaDataProperty {
  GeoObjectMetaDataProperty({
    this.geocoderMetaData,
  });

  GeocoderMetaData? geocoderMetaData;

  factory GeoObjectMetaDataProperty.fromJson(Map<String, dynamic> json) => GeoObjectMetaDataProperty(
    geocoderMetaData: GeocoderMetaData.fromJson(json["GeocoderMetaData"]),
  );

  Map<String, dynamic> toJson() => {
    "GeocoderMetaData": geocoderMetaData!.toJson(),
  };
}

class GeocoderMetaData {
  GeocoderMetaData({
    this.precision,
    this.text,
    this.kind,
    this.address,
    this.addressDetails,
  });

  Precision? precision;
  String? text;
  Kind? kind;
  Address? address;
  AddressDetails? addressDetails;

  factory GeocoderMetaData.fromJson(Map<String, dynamic> json) => GeocoderMetaData(
    precision: precisionValues.map[json["precision"]],
    text: json["text"],
    kind: kindValues.map[json["kind"]],
    address: Address.fromJson(json["Address"]),
    addressDetails: AddressDetails.fromJson(json["AddressDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "precision": precisionValues.reverse[precision],
    "text": text,
    "kind": kindValues.reverse[kind],
    "Address": address!.toJson(),
    "AddressDetails": addressDetails!.toJson(),
  };
}

class Address {
  Address({
    this.countryCode,
    this.formatted,
    this.components,
  });

  CountryCode? countryCode;
  String? formatted;
  List<Component>? components;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    countryCode: countryCodeValues.map[json["country_code"]],
    formatted: json["formatted"],
    components: List<Component>.from(json["Components"].map((x) => Component.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "country_code": countryCodeValues.reverse[countryCode],
    "formatted": formatted,
    "Components": List<dynamic>.from(components!.map((x) => x.toJson())),
  };
}

class Component {
  Component({
    this.kind,
    this.name,
  });

  Kind? kind;
  String? name;

  factory Component.fromJson(Map<String, dynamic> json) => Component(
    kind: kindValues.map[json["kind"]],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "kind": kindValues.reverse[kind],
    "name": name,
  };
}

enum Kind { COUNTRY, PROVINCE, LOCALITY, DISTRICT, HOUSE, STREET }

final kindValues = EnumValues({
  "country": Kind.COUNTRY,
  "district": Kind.DISTRICT,
  "house": Kind.HOUSE,
  "locality": Kind.LOCALITY,
  "province": Kind.PROVINCE,
  "street": Kind.STREET
});

enum CountryCode { UZ }

final countryCodeValues = EnumValues({
  "UZ": CountryCode.UZ
});

class AddressDetails {
  AddressDetails({
    this.country,
  });

  Country? country;

  factory AddressDetails.fromJson(Map<String, dynamic> json) => AddressDetails(
    country: Country.fromJson(json["Country"]),
  );

  Map<String, dynamic> toJson() => {
    "Country": country!.toJson(),
  };
}

class Country {
  Country({
    this.addressLine,
    this.countryNameCode,
    this.countryName,
    this.administrativeArea,
  });

  String? addressLine;
  CountryCode? countryNameCode;
  CountryName? countryName;
  AdministrativeArea? administrativeArea;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    addressLine: json["AddressLine"],
    countryNameCode: countryCodeValues.map[json["CountryNameCode"]],
    countryName: countryNameValues.map[json["CountryName"]],
    administrativeArea: AdministrativeArea.fromJson(json["AdministrativeArea"]),
  );

  Map<String, dynamic> toJson() => {
    "AddressLine": addressLine,
    "CountryNameCode": countryCodeValues.reverse[countryNameCode],
    "CountryName": countryNameValues.reverse[countryName],
    "AdministrativeArea": administrativeArea!.toJson(),
  };
}

class AdministrativeArea {
  AdministrativeArea({
    this.administrativeAreaName,
    this.locality,
  });

  Name? administrativeAreaName;
  Locality? locality;

  factory AdministrativeArea.fromJson(Map<String, dynamic> json) => AdministrativeArea(
    administrativeAreaName: nameValues.map[json["AdministrativeAreaName"]],
    locality: Locality.fromJson(json["Locality"]),
  );

  Map<String, dynamic> toJson() => {
    "AdministrativeAreaName": nameValues.reverse[administrativeAreaName],
    "Locality": locality!.toJson(),
  };
}

enum Name { TOSHKENT }

final nameValues = EnumValues({
  "Toshkent": Name.TOSHKENT
});

class Locality {
  Locality({
    this.localityName,
    this.dependentLocality,
    this.thoroughfare,
  });

  Name? localityName;
  LocalityDependentLocality? dependentLocality;
  Thoroughfare? thoroughfare;

  factory Locality.fromJson(Map<String, dynamic> json) => Locality(
    localityName: nameValues.map[json["LocalityName"]],
    dependentLocality: json["DependentLocality"] == null ? null : LocalityDependentLocality.fromJson(json["DependentLocality"]),
    thoroughfare: json["Thoroughfare"] == null ? null : Thoroughfare.fromJson(json["Thoroughfare"]),
  );

  Map<String, dynamic> toJson() => {
    "LocalityName": nameValues.reverse[localityName],
    "DependentLocality": dependentLocality == null ? null : dependentLocality!.toJson(),
    "Thoroughfare": thoroughfare == null ? null : thoroughfare!.toJson(),
  };
}

class LocalityDependentLocality {
  LocalityDependentLocality({
    this.dependentLocalityName,
    this.dependentLocality,
  });

  String? dependentLocalityName;
  PurpleDependentLocality? dependentLocality;

  factory LocalityDependentLocality.fromJson(Map<String, dynamic> json) => LocalityDependentLocality(
    dependentLocalityName: json["DependentLocalityName"],
    dependentLocality: PurpleDependentLocality.fromJson(json["DependentLocality"]),
  );

  Map<String, dynamic> toJson() => {
    "DependentLocalityName": dependentLocalityName,
    "DependentLocality": dependentLocality!.toJson(),
  };
}

class PurpleDependentLocality {
  PurpleDependentLocality({
    this.dependentLocalityName,
    this.dependentLocality,
  });

  String? dependentLocalityName;
  FluffyDependentLocality? dependentLocality;

  factory PurpleDependentLocality.fromJson(Map<String, dynamic> json) => PurpleDependentLocality(
    dependentLocalityName: json["DependentLocalityName"],
    dependentLocality: FluffyDependentLocality.fromJson(json["DependentLocality"]),
  );

  Map<String, dynamic> toJson() => {
    "DependentLocalityName": dependentLocalityName,
    "DependentLocality": dependentLocality!.toJson(),
  };
}

class FluffyDependentLocality {
  FluffyDependentLocality({
    this.dependentLocalityName,
    this.premise,
  });

  String? dependentLocalityName;
  Premise? premise;

  factory FluffyDependentLocality.fromJson(Map<String, dynamic> json) => FluffyDependentLocality(
    dependentLocalityName: json["DependentLocalityName"],
    premise: Premise.fromJson(json["Premise"]),
  );

  Map<String, dynamic> toJson() => {
    "DependentLocalityName": dependentLocalityName,
    "Premise": premise!.toJson(),
  };
}

class Premise {
  Premise({
    this.premiseNumber,
  });

  String? premiseNumber;

  factory Premise.fromJson(Map<String, dynamic> json) => Premise(
    premiseNumber: json["PremiseNumber"],
  );

  Map<String, dynamic> toJson() => {
    "PremiseNumber": premiseNumber,
  };
}

class Thoroughfare {
  Thoroughfare({
    this.thoroughfareName,
    this.premise,
  });

  String? thoroughfareName;
  Premise? premise;

  factory Thoroughfare.fromJson(Map<String, dynamic> json) => Thoroughfare(
    thoroughfareName: json["ThoroughfareName"],
    premise: Premise.fromJson(json["Premise"]),
  );

  Map<String, dynamic> toJson() => {
    "ThoroughfareName": thoroughfareName,
    "Premise": premise!.toJson(),
  };
}

enum CountryName { O_ZBEKISTON }

final countryNameValues = EnumValues({
  "Oʻzbekiston": CountryName.O_ZBEKISTON
});

enum Precision { EXACT }

final precisionValues = EnumValues({
  "exact": Precision.EXACT
});

class Point {
  Point({
    this.pos,
  });

  String? pos;

  factory Point.fromJson(Map<String, dynamic> json) => Point(
    pos: json["pos"],
  );

  Map<String, dynamic> toJson() => {
    "pos": pos,
  };
}

class GeoObjectCollectionMetaDataProperty {
  GeoObjectCollectionMetaDataProperty({
    this.geocoderResponseMetaData,
  });

  GeocoderResponseMetaData? geocoderResponseMetaData;

  factory GeoObjectCollectionMetaDataProperty.fromJson(Map<String, dynamic> json) => GeoObjectCollectionMetaDataProperty(
    geocoderResponseMetaData: GeocoderResponseMetaData.fromJson(json["GeocoderResponseMetaData"]),
  );

  Map<String, dynamic> toJson() => {
    "GeocoderResponseMetaData": geocoderResponseMetaData!.toJson(),
  };
}

class GeocoderResponseMetaData {
  GeocoderResponseMetaData({
    this.point,
    this.boundedBy,
    this.request,
    this.results,
    this.found,
  });

  Point? point;
  BoundedBy? boundedBy;
  String? request;
  String? results;
  String? found;

  factory GeocoderResponseMetaData.fromJson(Map<String, dynamic> json) => GeocoderResponseMetaData(
    point: Point.fromJson(json["Point"]),
    boundedBy: BoundedBy.fromJson(json["boundedBy"]),
    request: json["request"],
    results: json["results"],
    found: json["found"],
  );

  Map<String, dynamic> toJson() => {
    "Point": point!.toJson(),
    "boundedBy": boundedBy!.toJson(),
    "request": request,
    "results": results,
    "found": found,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
