import 'address.dart';
import 'company.dart';
import 'geo.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'address': address.toJson(),
    'phone': phone,
    'website': website,
    'company': company.toJson(),
  };

  Map<String, dynamic> toDbJson() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'phone': phone,
    'website': website,
    'address_street': address.street,
    'address_suite': address.suite,
    'address_city': address.city,
    'address_zipcode': address.zipcode,
    'geo_lat': address.geo.lat,
    'geo_lng': address.geo.lng,
    'company_name': company.name,
    'company_catchPhrase': company.catchPhrase,
    'company_bs': company.bs,
  };

  factory User.fromDbJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    username: json['username'],
    email: json['email'],
    phone: json['phone'],
    website: json['website'],
    address: Address(
      street: json['address_street'],
      suite: json['address_suite'],
      city: json['address_city'],
      zipcode: json['address_zipcode'],
      geo: Geo(lat: json['geo_lat'], lng: json['geo_lng']),
    ),
    company: Company(
      name: json['company_name'],
      catchPhrase: json['company_catchPhrase'],
      bs: json['company_bs'],
    ),
  );
}
