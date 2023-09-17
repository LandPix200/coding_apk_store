import 'package:coding_apk_store/blocs/coding_apk/coding_apk_bloc.dart';
import 'package:coding_apk_store/modules/apk/components/apk_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CodingApkBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Coding Apk Store"),
        ),
        body: const Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CustomSearchBar(),
                SizedBox(
                  height: 25,
                ),
                ApkCardSearchResult(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ApkCardSearchResult extends StatelessWidget {
  const ApkCardSearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodingApkBloc, CodingApkState>(
      builder: (context, state) {
        print(state);
        if (state is CodingApkDownloadSuccess) {
          return ApkCard(apk: state.apk);
        }
        if (state is CodingApkDownloadLoading) {
          return const CircularProgressIndicator();
        }
        return Container(
          padding: const EdgeInsets.all(10),
          child: const Text("Aucun resultat"),
        );
      },
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodingApkBloc, CodingApkState>(
      builder: (context, state) {
        return SearchBar(
          hintText: "Rechercher une app",
          onChanged: (value) => context
              .read<CodingApkBloc>()
              .add(CodingApkDownloadEvent(appName: value)),
        );
      },
    );
  }
}
