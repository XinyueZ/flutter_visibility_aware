import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_visibility_aware/flutter_visibility_aware.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case "/VisibilityAwareStatelessPage":
            return MaterialPageRoute<void>(
              settings: settings,
              fullscreenDialog: true,
              builder: (BuildContext context) => VisibilityAwareStatelessPage(),
            );
          case "/VisibilityAwareStatefulPage":
            return MaterialPageRoute<void>(
              settings: settings,
              fullscreenDialog: true,
              builder: (BuildContext context) => VisibilityAwareStatefulPage(),
            );
          default:
            return MaterialPageRoute<void>(
              settings: settings,
              fullscreenDialog: true,
              builder: (BuildContext context) => SelectionPage(),
            );
        }
      },
    );
  }
}

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            VisibilityAware(
              visibleCallback: () async {
                debugPrint(
                    "RaisedButton for opening VisibilityAwareStatelessPage is visible.");
              },
              invisibleCallback: () async {
                debugPrint(
                    "RaisedButton for opening VisibilityAwareStatelessPage is invisible.");
              },
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamed(
                    "/VisibilityAwareStatelessPage",
                  );
                },
                child: Text("A stateless widget page example"),
              ),
            ),
            VisibilityAware(
              visibleCallback: () async {
                debugPrint(
                    "RaisedButton for opening VisibilityAwareStatefulPage is visible.");
              },
              invisibleCallback: () async {
                debugPrint(
                    "RaisedButton for opening VisibilityAwareStatefulPage is invisible.");
              },
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamed(
                    "/VisibilityAwareStatefulPage",
                  );
                },
                child: Text("A stateful widget page example"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VisibilityAwareStatelessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VisibilityAware(
      visibleCallback: () async {
        debugPrint("$this is visible.");
      },
      invisibleCallback: () async {
        debugPrint("$this is invisible.");
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Text(
              "$this",
            ),
          ),
        ),
      ),
    );
  }
}

class VisibilityAwareStatefulPage extends StatefulWidget {
  @override
  _VisibilityAwareStatefulPageState createState() =>
      _VisibilityAwareStatefulPageState();
}

class _VisibilityAwareStatefulPageState
    extends State<VisibilityAwareStatefulPage> {
  @override
  Widget build(BuildContext context) {
    return VisibilityAware(
      visibleCallback: () async {
        debugPrint("$widget is visible.");
      },
      invisibleCallback: () async {
        debugPrint("$widget is invisible.");
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Text(
              "$this",
            ),
          ),
        ),
      ),
    );
  }
}
