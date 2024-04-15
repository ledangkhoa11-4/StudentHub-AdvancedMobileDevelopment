import 'package:boilerplate/core/stores/form/form_student_profile_store.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

typedef OnPickedCallback = void Function(PlatformFile file, String name);
typedef OnRemoveCallback = void Function(String name);

class FilePickerWidget extends StatefulWidget {
  FilePickerWidget(
      {required this.name,
      required this.label,
      required this.formStore,
      required this.allowedExtensions,
      required this.onPicked,
      required this.onRemove,
      required this.onLoading,
      required this.finishLoading});

  final FormStudentProfileStore formStore;

  final OnPickedCallback onPicked;
  final OnRemoveCallback onRemove;
  final String name;
  final String label;
  final List<String> allowedExtensions;
  final VoidCallback onLoading;
  final VoidCallback finishLoading;
  @override
  State<FilePickerWidget> createState() => _FilePickerState();
}

class _FilePickerState extends State<FilePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return (Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.label,
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
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Allowed: ${widget.allowedExtensions.join(',').toUpperCase()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontSize: 11),
                                ),
                                widget.formStore.getFileObservable(
                                                widget.name) !=
                                            null &&
                                        widget.formStore
                                                .getFileObservable(widget.name)!
                                                .value !=
                                            null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${widget.formStore.getFileObservable(widget.name)!.value!.name}",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () => {
                                                    widget.onRemove(widget.name)
                                                  },
                                              icon:
                                                  Icon(BootstrapIcons.x_circle))
                                        ],
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ))),
                  )),
            ),
          ]));
    });
  }

  void _pickFile() async {
    widget.onLoading();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: widget.allowedExtensions);
    widget.finishLoading();

    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;
      if (widget.allowedExtensions.indexOf(file.extension ?? '') == -1) {
        ToastHelper.error(
            'Only allow: ${widget.allowedExtensions.join(',').toUpperCase()} file.');
      } else {
        widget.onPicked(file, widget.name);
      }
    }
  }
}
