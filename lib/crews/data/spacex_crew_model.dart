import 'package:equatable/equatable.dart';

class SpaceXCrew extends Equatable {
  final String? name;
  final String? agency;
  final String? image;
  final String? wikipedia;
  final List<String>? launches;
  final String? status;
  final String? id;

  const SpaceXCrew({
    this.name,
    this.agency,
    this.image,
    this.wikipedia,
    this.launches,
    this.status,
    this.id,
  });

  SpaceXCrew.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        agency = json['agency'] as String?,
        image = json['image'] as String?,
        wikipedia = json['wikipedia'] as String?,
        launches = (json['launches'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        status = json['status'] as String?,
        id = json['id'] as String?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'agency': agency,
        'image': image,
        'wikipedia': wikipedia,
        'launches': launches,
        'status': status,
        'id': id
      };

  @override
  List<Object?> get props => [
        name,
        agency,
        image,
        wikipedia,
        launches,
        status,
        id,
      ];
}
