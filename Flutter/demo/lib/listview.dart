import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 700,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(15.0),
        children: [
          CircleAvatar(
            maxRadius: 50,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person,size: 50,),
          ),
          Center(
            child: Text("Sakshi Vora",style: TextStyle(fontSize: 50),),
          ),
          Text("Lorem ipsum dolor sit amet. Et rerum rerum ut aliquam suscipit aut dolores repellat in amet amet nam reiciendis eius. Ut rerum temporibus sit consectetur mollitia ea nulla blanditiis? Cum pariatur accusantium sed iste consequatur ab tempore odio. Ut quia consequuntur aut cumque galisum a voluptates quia et voluptatum facilis et dolores necessitatibus vel necessitatibus maiores aut laudantium omnis.Lorem ipsum dolor sit amet. Et rerum rerum ut aliquam suscipit aut dolores repellat in amet amet nam reiciendis eius. Ut rerum temporibus sit consectetur mollitia ea nulla blanditiis? Cum pariatur accusantium sed iste consequatur ab tempore odio. Ut quia consequuntur aut cumque galisum a voluptates quia et voluptatum facilis et dolores necessitatibus vel necessitatibus maiores aut laudantium omnis.",style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemCount: 20,itemBuilder: (BuildContext context,int index){
        return ListTile(
          leading: Icon(Icons.list),
          trailing: Icon(Icons.delete),
          title: Text("Item $index",style: TextStyle(fontSize: 25),),
        );
      },),
    );
  }
}
// Padding(
//   padding: EdgeInsets.all(15.0),
//   child: TextField(
//     controller: nameController,
//     decoration: InputDecoration(
//         border: UnderlineInputBorder(),
//         hintText: "User name",
//         suffixIcon: IconButton(
//           icon: Icon(Icons.add),
//           onPressed: () {
//             setState(() {
//               student.add(nameController.toString());
//             });
//           },
//         )),
//   ),
// ),
