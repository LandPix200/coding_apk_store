import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coding_apk_store/api/coding_apk_services.dart';
import 'package:coding_apk_store/models/apk.dart';
import 'package:equatable/equatable.dart';

part 'coding_apk_event.dart';
part 'coding_apk_state.dart';

class CodingApkBloc extends Bloc<CodingApkEvent, CodingApkState> {
  CodingApkBloc() : super(CodingApkInitial()) {
    on<CodingApkDownloadEvent>(_download);
  }

  FutureOr<void> _download(
      CodingApkDownloadEvent event, Emitter<CodingApkState> emit) async {
    try {
      emit(CodingApkDownloadLoading());
      final result = await CodingApkServices.downloadApp(event.appName);
      emit(CodingApkDownloadSuccess(apk: result));
    } catch (e) {
      emit(CodingApkDownloadFailed());
    }
  }
}
