import 'package:boilerplate/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
class Candidate extends StatefulWidget {
  @override
  _CandidateState createState() => _CandidateState();
}

class _CandidateState extends State<Candidate> {
  bool isOfferSent = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      // constraints: BoxConstraints.expand(height: 20),
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    width: 60,
                    Assets.studentAvatar,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hung Le',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text('4th year student', style: Theme.of(context).textTheme.labelMedium!.copyWith(fontStyle: FontStyle.italic),),
                  ],
                )
              ],
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context).translate('fullstack_Engineer'), style: Theme.of(context).textTheme.labelLarge),
                Text(AppLocalizations.of(context).translate('excellent'), style: Theme.of(context).textTheme.labelLarge!.copyWith(fontStyle: FontStyle.italic)),
              ],
            ),
            SizedBox(height: 14.0),
            Text(
                AppLocalizations.of(context).translate('cand_text'),
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Theme.of(context).colorScheme.onSecondary)),
            SizedBox(height: 14.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text(AppLocalizations.of(context).translate('message'))),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(child: Text(AppLocalizations.of(context).translate('hired_offer'))),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Text(
        AppLocalizations.of(context).translate('candi_q'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: Text(AppLocalizations.of(context).translate('cancel')),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        isOfferSent = true;
                                      });
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: Text(AppLocalizations.of(context).translate('send')),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(isOfferSent ? AppLocalizations.of(context).translate('sent_hired_offer') : ''),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
