import 'package:equatable/equatable.dart';

class Apk extends Equatable {
  final String icone;
  final String lienDeTelechargement;
  final String nom;
  final String statusDeSecurite;
  final String taille;
  final int telechargements;

  const Apk({
    required this.icone,
    required this.lienDeTelechargement,
    required this.nom,
    required this.statusDeSecurite,
    required this.taille,
    required this.telechargements,
  });

  factory Apk.fromJson(Map<String, dynamic> json) {
    return Apk(
      icone: json['icone'],
      lienDeTelechargement: json['lien_de_telechargement'],
      nom: json['nom'],
      statusDeSecurite: json['statut_de_securite'],
      taille: json['taille'],
      telechargements: json['telechargements'],
    );
  }

  @override
  List<Object?> get props => [
        icone,
        lienDeTelechargement,
        nom,
        statusDeSecurite,
        taille,
        telechargements,
      ];
}
