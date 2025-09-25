import 'package:flutter/material.dart';
import 'package:masarat_alnahdha/core/widgets/global_custom_scaffold.dart';
import 'package:masarat_alnahdha/core/widgets/soon_widget.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalCustomScaffold(body: SoonWidget());
  }
}
