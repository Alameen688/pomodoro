import 'package:flutter/material.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';
import '../util/pomo_timer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PomoTimer timer;
  double _currentSessionProgress = 0.0;
  Color accent = Color(0XFFF09E8C);

  @override
  void initState() {
    super.initState();
    timer = PomoTimer(_onTimerUpdate)
      ..currentTime = PomoTimer.SESSION_TIME;
  }
  _onTimerUpdate() => setState(() {
    _currentSessionProgress = double.parse(
        ((timer.startTime.inSeconds - timer.currentTime.inSeconds)
            / timer.startTime.inSeconds).toStringAsFixed(3));
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          "Pomo25",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 35.0,
            fontWeight: FontWeight.bold,),
        ),
      ),
      backgroundColor: Colors.transparent,
    ),
    body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 15.0),
        child: Column(children: <Widget>[_timerWidget(), _control()],)),
  );

  Widget _timerWidget() => Center(
      child: Container(
        width: 300.0,
        height: 350.0,
        child: Stack(children: <Widget>[_progress(type: "outer"), _progress()],),
      ));

  Widget _control() => Container(
    margin: EdgeInsets.only(top: 50),
    child: RaisedButton(
      elevation: 8.0,
      color: timer.isRunning ? Colors.teal.shade200 : accent,
      onPressed: timer.isRunning ? timer.reset : timer.start,
      child: Text(
        timer.isRunning ? "RESET" : "START",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            fontStyle: FontStyle.italic),
      ),
      padding: EdgeInsets.all(30.0),
      shape: CircleBorder(),
    ),
  );

  Widget _progress({String type}) {
    final child = Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: type == "outer" ? null : LinearGradient(colors: [accent, Color(0XFFF3D4A0)])),
      child: type == "outer" ? _buildRadialProgress(accent, !timer.isBreak ? _currentSessionProgress : 1.0)
          : _buildRadialProgress(Colors.orangeAccent, timer.isBreak ? _currentSessionProgress : 0.0, _ticker()),
    );
    return type == "outer" ? child : Center(child: Container(width: 250, height: 250, child: child),);
  }
  Widget _buildRadialProgress(Color progressColor, double progressPercent,
      [Widget centerContent]) =>
      RadialProgressBar(
          trackWidth: 20.0,
          trackColor: Colors.teal.shade50,
          progressPercent: progressPercent,
          progressWidth: 20.0,
          progressColor: progressColor,
          centerContent: centerContent);

  Widget _ticker() => Center(
    child: Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
          color: Colors.black45,
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black.withOpacity(.5), blurRadius: 10.0)]),
      child: Center(
        child: Text("${timer.formattedCurrentTime}",
            style: TextStyle(fontSize: 65.0, fontWeight: FontWeight.bold)),
      ),
    ),
  );
}
