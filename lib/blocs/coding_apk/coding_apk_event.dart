part of 'coding_apk_bloc.dart';

sealed class CodingApkEvent extends Equatable {
  const CodingApkEvent();

  @override
  List<Object> get props => [];
}

class CodingApkDownloadEvent extends CodingApkEvent {
  final String appName;

  const CodingApkDownloadEvent({required this.appName});

  @override
  List<Object> get props => [appName];
}
