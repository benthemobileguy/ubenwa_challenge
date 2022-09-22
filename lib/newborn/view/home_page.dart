import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubenwa_challenge/newborn/bloc/newborn_bloc.dart';
import 'package:ubenwa_challenge/newborn/view/custom-switch.dart';
import 'package:ubenwa_challenge/newborn/view/widgets/shimmer-listview.dart';

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSwitchChanged = false;
  final service = FlutterBackgroundService();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchServiceStatus();
  updateList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewBornBloc, NewBornState>(
        builder: (BuildContext context, state) {
          if(state is NewBornLoading){
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black54,
              ),
            );
           }
            if (state is NewBornLoaded) {
              return state.listOfNewBorn.data.isNotEmpty? ListView.builder(
                  itemCount: state.listOfNewBorn.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: Colors.black54,
                      leading: Text(state.listOfNewBorn.data[index].attributes!.userId!.toString().toUpperCase(),
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.w600)),
                      trailing: Text(state.listOfNewBorn!.data[index].attributes!.gender!.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.w600)),
                      title: Text(state.listOfNewBorn!.data[index].attributes!.name.toString().toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'NotoSans',
                            fontWeight: FontWeight.w600)),
                    );
                  }):   Center(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: const Text('No Newborns present',
                      style: TextStyle(
                          fontSize: 18.5,
                          color: Colors.black54,
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.w700)),
                    ),
                  );
            }
            if (state is NewBornError) {
              return const Center(
                child: Text(
                  'Sorry, an error occurred',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrangeAccent),
                ),
              );
            }
            return ShimmerListView();

        },
      ),
      backgroundColor: const Color(0xffFBF5FF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
            title: const Text(
              'Home',
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 15),
                child: flutterSwitch(isSwitchChanged,
                    onToggle: (val) {
                  setState(() {
                    isSwitchChanged = !isSwitchChanged;
                  });
                  if(val == true){
                    Fluttertoast.showToast(
                        msg: "Background service started!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.deepOrangeAccent,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    service.startService();
                  }else{
                    service.invoke("stopService");
                    Fluttertoast.showToast(
                        msg: "Background service stopped!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                }),
              )
            ],
            centerTitle: false,
            backgroundColor: Colors.black54),
      ),
    );
  }

  void fetchServiceStatus() {
  service.isRunning().then((value){
    setState(() {
      isSwitchChanged = value;
    });
  });
  }

  updateList() {
    BlocProvider.of<NewBornBloc>(context).add(const FetchNewBornEvent());
  }
}
