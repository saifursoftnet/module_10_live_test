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
      title: "My App",
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
  void selectedItems(){
    for(int i=0; i < itemList.length; i++){
      if(itemList[i].status != 0){
        count++;
      }
    }
  }
  itemSelectedAlert(){
    return showDialog(context: context, barrierDismissible: false ,builder: (context){
      return AlertDialog(
        title: const Text("Selected Item"),
        content: Text('You have Selected: $count'),
        actions: [
          ElevatedButton(
              onPressed: (){
                count = 0;
                Navigator.pop(context);
              },
              child: const Text("Close")
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selection Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          selectedItems();
          itemSelectedAlert();
        },
        child: const Icon(Icons.check),
      ),
      body: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index){
            return Card(
              color: Color(itemList[index].status == 0 ? 0xFFFFFF : 0xFFADD8E5),
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
