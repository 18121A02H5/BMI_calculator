import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyHomePage();
  }

}
class _MyHomePage extends State<StatefulWidget>{
  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();
  var result="";

  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.blue,
       title: Text("BMI CALCULATOR"),
     ),
     body:Container(
       color: Colors.amber,
       child: Center(
         child: Container(

           width: 300,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('BMI',style: TextStyle(fontSize: 31,fontWeight: FontWeight.w800),),
               TextField(
                 controller: wtController,
                 decoration: InputDecoration(
                   label: Text("Enter your weight in kgs"),
                   prefixIcon: Icon(Icons.line_weight),

                 ),
                 keyboardType: TextInputType.number,
               ),
               SizedBox(height: 11,),

               TextField(
                 controller: ftController,
                 decoration: InputDecoration(
                   label: Text("Enter your height in feets"),
                   prefixIcon: Icon(Icons.height),

                 ),
                 keyboardType: TextInputType.number,
               ),
               SizedBox(height: 11,),
               TextField(
                 controller: inController,
                 decoration: InputDecoration(
                   label: Text("Enter your heiht in inches"),
                   prefixIcon: Icon(Icons.height),

                 ),
                 keyboardType: TextInputType.number,
               ),
               ElevatedButton(onPressed: (){
                 var wt=wtController.text.toString();
                 var ft=ftController.text.toString();
                 var inch= inController.text.toString();
                 if(wt!="" && ft!="" && inch!=""){
                    var iWt=int.parse(wt);
                    var iFt=int.parse(ft);
                    var iInch=int.parse(inch);
                    var tInch=(iFt*12)+iInch;
                    var tCm=tInch*2.54;
                    var tM=tCm/100;
                    var bmi=iWt/(tM*tM);
                    result="your bmi is:${bmi.toStringAsFixed(3)}";
                    setState(() {

                    });
                 }
                 else{
                   setState(() {
                     result="please fill LLL THE required blanks";
                   });

                 }
               }, child: Text("Calculate")),
               Text(result,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),)
             ],
           ),
         ),
       ),
     )
   );
  }

}