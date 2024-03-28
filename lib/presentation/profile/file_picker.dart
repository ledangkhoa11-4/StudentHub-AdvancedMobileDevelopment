import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerWidget extends StatefulWidget {
  FilePickerWidget({required this.name, required this.allowedExtensions});

  final String name;
  final List<String> allowedExtensions;
  @override
  State<FilePickerWidget> createState() => _FilePickerState();
}

class _FilePickerState extends State<FilePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return (Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 120,
            child: DottedBorder(
                color: Theme.of(context).colorScheme.onPrimary,
                strokeWidth: 2,
                radius: Radius.circular(10),
                dashPattern: [10, 5],
                customPath: (size) {
                  return Path()
                    ..moveTo(10, 0)
                    ..lineTo(size.width - 10, 0)
                    ..arcToPoint(Offset(size.width, 10),
                        radius: Radius.circular(10))
                    ..lineTo(size.width, size.height - 10)
                    ..arcToPoint(Offset(size.width - 10, size.height),
                        radius: Radius.circular(10))
                    ..lineTo(10, size.height)
                    ..arcToPoint(Offset(0, size.height - 10),
                        radius: Radius.circular(10))
                    ..lineTo(0, 10)
                    ..arcToPoint(Offset(10, 0), radius: Radius.circular(10));
                },
                child: Container(
                  child: Center(
                      child: ElevatedButton(
                          style: IconButton.styleFrom(
                              minimumSize: Size.fromHeight(120),
                              splashFactory: NoSplash.splashFactory,
                              highlightColor: Colors.transparent,
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              elevation: 0),
                          onPressed: () {
                            _pickFile();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(BootstrapIcons.filetype_pdf),
                              SizedBox(height: 5,),
                              Text(
                                'Allowed: ${widget.allowedExtensions.join(',').toUpperCase()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 11),
                              )
                            ],
                          ))),
                )),
          ),
        ]));
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: widget.allowedExtensions
    );
    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;
      if (widget.allowedExtensions.indexOf(file.extension ?? '') == -1 ) {
        ToastHelper.error('Only allow: ${widget.allowedExtensions.join(',').toUpperCase()} file.');
      }
      print(123);
    }
  }
}
