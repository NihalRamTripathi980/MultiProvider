import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/one_example_provider.dart';

class OneExampleScreen extends StatefulWidget {
  const OneExampleScreen({Key? key}) : super(key: key);

  @override
  State<OneExampleScreen> createState() => _OneExampleScreenState();
}

class _OneExampleScreenState extends State<OneExampleScreen> {


  @override
  Widget build(BuildContext context) {
    print("build");
  //  final provider =Provider.of<OneExampleProvider>(context,listen: true);  we are not using this because are using  consumer below
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello , Nihal", style: TextStyle(
          fontSize: 15
        ),),
      ) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<OneExampleProvider>(builder: (context,value,child){
            return   Slider(
                min: 0,
                max: 1,
                value: value.value, onChanged: (val){

              value.setValue(val);
            });
          }),

          Consumer<OneExampleProvider>(builder: (context,value,child){
            return   Row(
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)
                    ),
                    child: const Text(
                        "Container !"
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value)
                    ),
                    child: const Text(
                        "Container !"
                    ),
                  ),
                )
              ],
            );
          }),


        ],
      ),

    );
  }
}
