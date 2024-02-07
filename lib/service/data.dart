import 'package:flutter/material.dart';

class ExampleCandidateModel {
  final IconData icon;
  final String name;
  final String status;

  ExampleCandidateModel({
    required this.icon,
    required this.name,
    required this.status,
  });
}

final List<ExampleCandidateModel> candidates = [
  ExampleCandidateModel(
    icon: Icons.person,
    name: 'One, 1',
    status: 'Developer',
  ),
  ExampleCandidateModel(
    icon: Icons.abc,
    name: 'Two, 2',
    status: 'Manager',
  ),
  ExampleCandidateModel(
    icon: Icons.phone_android_rounded,
    name: 'Three, 3',
    status: 'Engineer',
  ),
  ExampleCandidateModel(
    icon: Icons.abc,
    name: 'Four, 4',
    status: 'Designer',
  ),
];
