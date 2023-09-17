import 'package:coding_apk_store/models/apk.dart';
import 'package:coding_apk_store/utils/numbers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ApkCard extends StatelessWidget {
  const ApkCard({super.key, required this.apk});

  final Apk apk;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(apk.icone),
          ListTile(
            title: Text(apk.nom),
            subtitle: Text(
                "Nombre de telechargements ${NumberUtils.formatNumberM(apk.telechargements)}"),
          ),
          ElevatedButton.icon(
            onPressed: _download,
            icon: const Icon(Icons.download),
            label: Text("Télécharger ${apk.taille}"),
          )
        ],
      ),
    );
  }

  void _download() async {
    if (!await launchUrl(
      Uri.parse(apk.lienDeTelechargement),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch ${apk.lienDeTelechargement}');
    }
  }
}
