import 'package:flutter/material.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';

class BiologyMcqs extends StatelessWidget {
  const BiologyMcqs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: UMAppBar(
        title: Text('MCQs'),
        showBackArrow: true,
      ),
    );
  }
}
