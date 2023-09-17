part of 'coding_apk_bloc.dart';

sealed class CodingApkState extends Equatable {
  const CodingApkState();

  @override
  List<Object> get props => [];
}

final class CodingApkInitial extends CodingApkState {}

final class CodingApkDownloadLoading extends CodingApkState {}

final class CodingApkDownloadSuccess extends CodingApkState {
  final Apk apk;

  const CodingApkDownloadSuccess({required this.apk});

  @override
  List<Object> get props => [apk];
}

final class CodingApkDownloadFailed extends CodingApkState {}
