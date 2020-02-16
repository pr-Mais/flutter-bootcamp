import 'package:flutter/material.dart';

//typedef LoadingFunction<T> = Future<T> Function(BuildContext context);
//typedef LoadingBuilder<T> = Widget Function(BuildContext context, T data);

class LoadingFrame<T> extends StatefulWidget {
  const LoadingFrame({
    Key key, 
    @required this.loader,
    @required this.builder,
  }) : super(key: key);

  //final LoadingFunction<T> loader;
  //final LoadingBuilder<T> builder;
  final Function(BuildContext) loader;
  final Function(BuildContext, T) builder;

  @override
  _LoadingFrameState createState() => _LoadingFrameState<T>();
}

class _LoadingFrameState<T> extends State<LoadingFrame<T>> {
  Future<T> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.loader(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {  
        if(snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if(snapshot.hasData){
          return widget.builder(context, snapshot.data);
        } else if(snapshot.connectionState != ConnectionState.done){
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}