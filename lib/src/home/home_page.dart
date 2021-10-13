import 'package:app_02/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = HomeController();
  _success(){
    return ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          var todo = controller.todos[index];
          return ListTile(
            leading: Checkbox(
              value: todo.completed,
              onChanged: (bool? value){
              },
            ),
            title: Text(todo.title),
        );
      });
  }

  _loading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
   _error(){
    return Center(
      child: ElevatedButton(
        onPressed: (){
          controller.start();
        },
        child: Text('Tentar Novamente'),
      ),
    );
  }
  _start(){
    return Container();
  }

  stateManagement(HomeState state){
    switch (state){
      case HomeState.start:
        return _start();
      case HomeState.error:
        return _error();
      case HomeState.loading:
        return _loading();
      case HomeState.success:
        return _success();
      default: 
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    controller.start();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List todos'),
        actions: [
          IconButton(onPressed: (){
            controller.start();
          }, icon: Icon(Icons.refresh_outlined))
        ],
      ),
      body: AnimatedBuilder(animation: controller.state, builder: (context, child){
        return stateManagement(controller.state.value);
      }),
      
    );
  }
}