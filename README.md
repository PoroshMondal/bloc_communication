# bloc_communication

A new Flutter project of BLoC/Cubit communication

## Getting Started

This tutorial project to practice single/multiple BLoC/Cubit to single/multiple BLoC/Cubit communication.

## BLoC Communication
- Bloc to Bloc communication through StreamSubscription
- Bloc to Bloc communication through BlocListener

## StreamSubscription
Pros
- Organised, Structure and easy to read and maintain

Cons
- The Major pros is Not Closing the StreamSubscription which may leads a huge memory leaks
- It may get chaos in large application when there's a lot of Bloc to Bloc communication happens.

## BLoCListener Communication
Pros
- StreamSubscription manages internally by the BlocListener
- The major advantage is No Stream/Memory leaks happens through this

Cons
- The UI may get clutter and hard to read with multiple BlocListener

## Activate the specific communication
To activate the specific Bloc/Cubit communication, just comment/uncomment desired code block from main.dart file

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter BLoC development, view the
[online documentation](https://bloclibrary.dev/#/)
