import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../utils/locale/app_localization.dart';

class ViewPdfScreen extends StatefulWidget {
  final String title;
  final String url;

  const ViewPdfScreen({super.key, required this.title, required this.url});

  @override
  State<ViewPdfScreen> createState() => _ViewPdfScreenState();
}

class _ViewPdfScreenState extends State<ViewPdfScreen> {
  final UserStore _userStore = getIt<UserStore>();
  PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.title}'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_up,
              ),
              onPressed: () {
                _pdfViewerController.previousPage();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
              ),
              onPressed: () {
                _pdfViewerController.nextPage();
              },
            )
          ],
        ),
        body: Container(
            child: SfPdfViewer.network(onDocumentLoadFailed: (details) {
          ToastHelper.error(AppLocalizations.of(context).translate('err_in_load_pdf') + " ${widget.title}");
        }, controller: _pdfViewerController, '${widget.url}')));
  }
}
