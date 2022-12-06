import 'dart:convert';

import 'package:example/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aws_rekognition/flutter_aws_rekognition.dart';

class FuncPage extends StatefulWidget {
  const FuncPage({
    super.key,
    required this.title,
    this.onTap,
    this.expandedHeight = 300,
    this.content,
  });

  final String title;

  final double expandedHeight;

  final Future<RekognitionData> Function()? onTap;

  final Widget? content;

  @override
  State<FuncPage> createState() => _FuncPageState();
}

class _FuncPageState extends State<FuncPage> with AutomaticKeepAliveClientMixin {
  String _text = 'Tap to request';

  Future<void> _onTap() async {
    showLoading(context);

    widget.onTap?.call().then((RekognitionData data) {
      setState(() {
        _text = const JsonEncoder.withIndent('  ').convert(data.toJson());
      });
    }, onError: (Object e) {
      setState(() {
        _text = e.toString();
      });
    }).whenComplete(() {
      Navigator.pop<void>(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, __) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: widget.expandedHeight,
              flexibleSpace: FlexibleSpaceBar(
                background: widget.content,
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20).copyWith(bottom: 200),
          child: SelectableText(_text),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: _onTap,
        child: Text(widget.title),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
