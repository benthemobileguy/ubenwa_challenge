import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:newborn_repository/newborn_repository.dart';
import 'package:ubenwa_challenge/newborn/data/model/newborn.dart';
part 'newborn_event.dart';
part 'newborn_state.dart';

class NewBornBloc extends HydratedBloc<NewBornEvent, NewBornState> {
  final NewBornRepository newbornRepository;

  NewBornBloc({required this.newbornRepository}) : super(NewBornLoading()) {
    on<AddNewBorn>((event, emit) async {
      String uniqueKey = UniqueKey().toString();
      final directory = await getApplicationDocumentsDirectory();
      //we want to first capture 10 seconds audio recording from the device
     // Check and request permission
      final record = Record();
      if (await record.hasPermission()) {
        // Start recording
        await record.start(
          path: '${directory.path}/myFile.m4a',
          encoder: AudioEncoder.aacLc, // by default
          bitRate: 128000, // by default
          samplingRate: 44100, // by default
        );
      }
     bool isRecording = await record.isRecording();
      //record for 10 seconds if I have the permission
     await Future.delayed(const Duration(seconds: 10)).then((_) async {
        // Stop recording
        await record.stop();
        await newbornRepository.postNewborn(
            name: uniqueKey,
            gestation: "2021-08-26T12:04:50.821Z",
            password: "password");
        emit(NewBornLoading());
        await newbornRepository.fetchNewborns().then((value) {
          final Map<String, dynamic> data = json.decode(value.body);
          NewBorn newBornList = NewBorn.fromJson(data);
          emit(NewBornLoaded(newBornList));
        });
      });
    });
    on<FetchNewBornEvent>((event, emit) async {
      emit(NewBornLoading());
      await newbornRepository.fetchNewborns().then((value) {
        final Map<String, dynamic> data = json.decode(value.body);
        NewBorn newBornList = NewBorn.fromJson(data);
        emit(NewBornLoaded(newBornList));
      });
    });
  }

  //Every time the app requires data from the application directory, this method is invoked.
  @override
  NewBornState? fromJson(Map<String, dynamic> json) {
    try {
      final List<NewBorn> listOfNewBorn = (json['newborns'] as List)
          .map((e) => NewBorn.fromJson(e as Map<String, dynamic>))
          .toList();

      newbornRepository.newBornList = listOfNewBorn as NewBorn?;
      // return NewBornLoaded(listOfNewBorn);
    } catch (e) {
      return null;
    }
    return null;
  }

  //Every state emitted by the NewBornBloc is converted to JSON using this method before storing it to the local directory.
  @override
  Map<String, dynamic>? toJson(NewBornState state) {
    if (state is NewBornLoaded) {
      return state.toJson();
    } else {
      return null;
    }
  }
}
