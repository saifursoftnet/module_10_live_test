
import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreenState(),
      title: "App",
    );
  }
}
class HomeScreenState extends StatefulWidget{
  const HomeScreenState({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenUI();
}
class Items{
  late String name;
  late int status;

  Items(this.name, this.status);
}
class HomeScreenUI extends State<HomeScreenState>{
  int count = 0;

  List<Items>  itemList = [
    Items("Item1", 0),
    Items("Item2", 0),
    Items("Item3", 0),
    Items("Item4", 0),
    Items("Item5", 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selection Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: const Icon(Icons.check),
      ),
      body: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index){
            return Card(
              color: Color(itemList[index].status == 0 ? 0xFFFFFF : 0xFF0000FF),
              child: ListTile(
                onTap: (){
                  if(itemList[index].status == 0){
                    itemList[index].status = 1;
                  }else{
                    itemList[index].status = 0;
                  }
                  setState(() {});
                },
                title: Text("Item ${index+1}"),
              ),
            );
          }
      ),
    );
  }
}
