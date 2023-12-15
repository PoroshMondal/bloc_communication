import 'package:bloc_communication/stream_subscription_listen/business_logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/enums.dart';
import '../../business_logic/cubit/listener_counter_cubit.dart';
import '../../business_logic/cubit/listener_internet_cubit.dart';
import '../../utils/utils.dart';

class ListenerHomeScreen extends StatefulWidget {
  const ListenerHomeScreen({
    super.key,
    this.title = "",
    this.color = Colors.blue
  });

  final String title;
  final Color color;

  @override
  State<StatefulWidget> createState() {
    return _ListenerHomeScreen(appTitle: this.title);
  }
}

class _ListenerHomeScreen extends State<ListenerHomeScreen> {
  final String appTitle;
  _ListenerHomeScreen({required this.appTitle});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ListenerInternetCubit,ListenerInternetState>(
        listener: (context, state){
          if(state is InternetConnected && state.connectionType == ConnectionType.Wifi){
            context.read<ListenerCounterCubit>().increment();
          } else if (state is InternetConnected && state.connectionType == ConnectionType.Mobile){
            context.read<ListenerCounterCubit>().decrement();
          }
        },
        child: Scaffold(
          appBar: AppBar(title: Text(appTitle),),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ListenerInternetCubit, ListenerInternetState>(
                  builder: (context, state) {
                    if(state is InternetConnected && state.connectionType == ConnectionType.Wifi){
                      return Text('Connected to Wifi',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.green),
                          textAlign: TextAlign.center
                      );
                    } else if (state is InternetConnected && state.connectionType == ConnectionType.Mobile){
                      return Text('Connected to Mobile Data',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.blueAccent),
                          textAlign: TextAlign.center);
                    } else {
                      return Text('Disconnected',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.red),
                        textAlign: TextAlign.center,);
                    }
                  },
                ),
                Text("You have pushed the button this many times: ", style: Theme.of(context).textTheme.labelLarge,),
                const SizedBox(height: 5,),
                BlocConsumer<ListenerCounterCubit, ListenerCounterState>(
                  listener: (context, state) {
                    if (state.wasIncremented) {
                      Utils.mySnackBar(context, "Incremented");
                    } else {
                      Utils.mySnackBar(context, "Decremented");
                    }
                  },

                  builder: (context, state) {
                    int value = state.counterValue;
                    String txtData = "";
                    if (value < 0) {
                      txtData = "Negative COUNTER VALUE: ${value.toString()}";
                    } else if (value == 0) {
                      txtData = "COUNTER VALUE: ${value.toString()}";
                    } else {
                      txtData = "Positive COUNTER VALUE: ${value.toString()}";
                    }
                    //return Text("COUNTER VALUE: ${state.counterValue.toString()}", style: Theme.of(context).textTheme.headlineMedium,);
                    return Text(txtData, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center,);
                  },
                ),

                const SizedBox(height: 10),

                /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: (){
                    //BlocProvider.of<ListenerCounterCubitTwo>(context).decrement();
                    context.read<ListenerCounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),

                const SizedBox(height: 0, width: 10,),

                FloatingActionButton(
                  onPressed: (){
                    context.read<ListenerCounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),*/

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    // Named ROUTE ACCESS
                    Navigator.of(context).pushNamed('/second');
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      side: const BorderSide(color: Colors.blue),
                      padding: const EdgeInsets.all(18),
                      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: const Text("Go to Second screen"),
                ),

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    // Named, Generate and Global ROUTE ACCESS
                    // calls are same that is pushNamed
                    Navigator.of(context).pushNamed('/third');
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      side: const BorderSide(color: Colors.blue),
                      padding: const EdgeInsets.all(18),
                      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: const Text("Go to Third screen"),
                ),
              ],
            ),
          ),
        ),
    );
  }

}

