import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/views/organization/widget/organization_builder.dart';
import 'package:intranet_movil/widget/skeletons/list_view_company.dart';

class CancunDirectoryPage extends StatefulWidget {
  const CancunDirectoryPage({Key? key, required this.directoryModel})
      : super(key: key);
  final List<DirectoryModel> directoryModel;

  @override
  State<CancunDirectoryPage> createState() => _CancunDirectoryPageState();
}

class _CancunDirectoryPageState extends State<CancunDirectoryPage> {
  @override
  Widget build(BuildContext context) {
    return widget.directoryModel.isEmpty
        ? const ListviewCompanyPage()
        : OrganizationBuilder(directoryData: widget.directoryModel);
  }
}
