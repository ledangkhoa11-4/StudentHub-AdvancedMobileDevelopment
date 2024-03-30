import 'package:flutter/material.dart';
import 'candidate.dart';

class CandidateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2, // Number of candidates
      itemBuilder: (context, index) {
        return Candidate();
      },
    );
  }
}
