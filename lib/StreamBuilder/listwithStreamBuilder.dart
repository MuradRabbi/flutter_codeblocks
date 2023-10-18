import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  late Stream<int> stream;

  @override
  void initState() {
    stream = Stream.periodic(Duration(seconds: 1), (int i) => i);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            title: Text('Sliver App Bar'),
            floating: true,
            snap: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(90.0),
              child: Text('dddd'),
            ),
          ),
          StreamBuilder(
              stream: stream,
              builder: (context, snapshot) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) => ListTile(title: Text(snapshot.data.toString())),
                    childCount: snapshot.hasData ? 1 : 0,
                  )
              )
          )
        ])
    );
  }
}



// class SampleStreamBuilder extends StatelessWidget {
//
//
//   Stream<List<String>> loadData() async* {
//     await Future.delayed(Duration(seconds: 3));
//     yield List.generate(10, (index) => "Index $index");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<List<String>>(
//         stream: loadData(),
//         builder: (context, snapshot) {
//           return snapshot.hasData
//               ? CustomScrollView(
//             slivers: [
//               SliverList(
//                 delegate: SliverChildBuilderDelegate((context, index) {
//                   return ListTile(
//                     title: Text(snapshot.data![index]),
//                   );
//                 }, childCount: snapshot.data!.length),
//               )
//             ],
//           )
//               : Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }