# `GetHelp!`

`GetHelp!` is a set of helper widgets and classes which make using [get](https://pub.dev/packages/get) and [get_cli](https://pub.dev/packages/get_cli) easier.

`GetHelp!` is also a great package for users of get which have experience using the [stacked](https://pub.dev/packages/stacked) architecture but want something lighter. `GetHelp!`'s emphasis on the use of `GetBuilderView`s means that a stacked persons MVVM with update() functions will be satisfied.

If you are using vscode, I have also included a handy snippets file.

## GetBuilderView

GetBuilderView is a great way to create a view with GetBuilder for get's simple state management system.

```dart
class MyView extends GetBuilderView<MyController> {
  const MyView({super.key});

  @override
  Widget builder(context, controller) {
    return const Scaffold();
  }
}
```

**IMPORTANT:**
This widget expects that you have already initialised your controller using a binding.
If you are not using bindings or you don't need global controller creation, add the init method to your [GetBuilderView].

You can also define the get builder to initialise local controllers by setting the [global] property to false, just the same as the [GetBuilder] widget.

```dart
class MyView extends GetBuilderView<MyController> {
  const MyView({super.key});

  /// Add the init method for initialising a Controller.
  /// By default, init is set to null.
  @override
  MyController? get init => MyController();

  /// Add the [global] method to turn off global controller creation.
  /// [global] defaults to true
  @override
  bool get global => false;

  @override
  Widget builder(context, controller) {
    return const Scaffold();
  }
}
```

Basically, GetBuilderView acts as a shorthand for this:

```dart
class MyView extends StatelessWidget {
  const MyView({super.key});

  @override
  Widget build(context) {
    return GetBuilder<MyController>(
      init: MyController(),
      builder: (controller) {
        return const Scaffold();
      },
    );
  }
}
```

Instead of this nested code, all you need to write is this:

## GetxFutureController

`GetxFutureController` (named with the _x_ to match `GetxController`) is a new controller type which adds a default implementation of awaiting futures based on [stacked](https://pub.dev/packages/stacked)'s `FutureViewModel`.



## Additional information

> TODO: Tell users more about the package: where to find more information, how to
> contribute to the package, how to file issues, what response they can expect
> from the package authors, and more.

If you do need someone to talk to about your mental health, I highly recommend you check out [checkpointorg.com](https://checkpointorg.com/global/) for more information about people and organisations in your area you can talk to. Your mental health is important. ❤️
