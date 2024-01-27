import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_project/Provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: (context, numbersListProvider, child) => Scaffold(
        appBar: AppBar(
          title: Text('Second Screen'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                numbersListProvider.numList.last.toString(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: numbersListProvider.numList.length,
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.all(4),
                    child: Text(
                      numbersListProvider.numList[index].toString(),
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.jumpTo(controller.position.maxScrollExtent);
            numbersListProvider.add();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
