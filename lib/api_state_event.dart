import 'package:blocApi/api_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ApiEvent extends Equatable {
  const ApiEvent();
  @override
  List<Object> get props => [];
}

class FetchApi extends ApiEvent {
  const FetchApi();
}

class ApiState extends Equatable {
  @override
  List<Object> get props => [];
}

class ApiEmpty extends ApiState {}

class ApiLoading extends ApiState {}

class ApiLoaded extends ApiState {
  List<ApiModel> api;
  ApiLoaded({@required this.api});

  @override
  List<Object> get props => [api];
}

class ApiError extends ApiState {}
