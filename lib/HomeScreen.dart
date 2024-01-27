import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_project/Provider.dart';
import 'package:studio_project/SecondScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: (context, numbersListProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          backgroundColor: Colors.grey,
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
                  reverse: true,
                  itemBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 50,
                    color: Colors.red,
                    margin: EdgeInsets.all(4),
                    alignment: Alignment.center,
                    child: Text(
                      numbersListProvider.numList[index].toString(),
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondScreen(),),),
                  icon: Icon(Icons.exit_to_app))
            ],
          ),
        ),
        floatingActionButton: Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                controller.jumpTo(controller.position.maxScrollExtent);
                numbersListProvider.add();
              },
              child: const Icon(Icons.add),
            ),FloatingActionButton(
              onPressed: () {
                controller.jumpTo(controller.position.maxScrollExtent);
                numbersListProvider.sub();
              },
              child: const Text('-'),
            ),
          ],
        ),
      ),
    );
  }
}
