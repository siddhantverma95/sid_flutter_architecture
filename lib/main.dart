import 'package:flutter/material.dart';
import 'package:flutter_architecture/counter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [Inject<Counter>(() => Counter())],
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  StateBuilder<Counter>(
                      observe: () => Injector.getAsReactive<Counter>(),
                      builder: (context, state) => state.whenConnectionState(
                          onIdle: () => Text(
                                '${state.state.count}',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                          onWaiting: () => CircularProgressIndicator(),
                          onData: (data) => Text(
                                '${data.count}',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                          onError: null)),
                  StateBuilder<Counter>(
                      observe: () => Injector.getAsReactive<Counter>(),
                      builder: (context, state) => state.whenConnectionState(
                          onIdle: () => Text(
                                '${state.state.count}',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                          onWaiting: () => CircularProgressIndicator(),
                          onData: (data) => Text(
                                '${data.count}',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                          onError: null)),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Injector.getAsReactive<Counter>()
                  .setState((s) => s.increament()),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        });
  }
}
