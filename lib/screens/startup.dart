import 'package:flutter/material.dart';
import 'package:yoga_app/screens/ready.dart';

class Startup extends StatelessWidget {
  const Startup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Ready()));
        },
        child: const Text(
          "Start",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            backgroundColor: Colors.blue,
            title: const Text('Yoga'),
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
                title: Text('Yoga For All'),
                centerTitle: true,
                background: Image(
                  image: AssetImage('assets/yoga.jpg'),
                  fit: BoxFit.cover,
                )),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up))],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        '30 Minutes || 10 Workouts',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Divider(thickness: 2),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (context, index) => ListTile(
                              leading:
                                  Image(image: AssetImage('assets/yoga.gif')),
                              title: Text(
                                '$index Yoga',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                              subtitle: const Text(
                                '00:20',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                        itemCount: 11),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
