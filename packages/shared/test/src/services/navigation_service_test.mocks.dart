// Mocks generated by Mockito 5.4.5 from annotations
// in shared/test/src/services/navigation_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:ui' as _i10;

import 'package:flutter/foundation.dart' as _i3;
import 'package:flutter/scheduler.dart' as _i6;
import 'package:flutter/services.dart' as _i7;
import 'package:flutter/src/widgets/focus_manager.dart' as _i2;
import 'package:flutter/src/widgets/framework.dart' as _i5;
import 'package:flutter/src/widgets/navigator.dart' as _i4;
import 'package:flutter/src/widgets/restoration.dart' as _i11;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;
import 'package:shared/shared.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFocusNode_0 extends _i1.SmartFake implements _i2.FocusNode {
  _FakeFocusNode_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeValueNotifier_1<T> extends _i1.SmartFake
    implements _i3.ValueNotifier<T> {
  _FakeValueNotifier_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNavigator_2 extends _i1.SmartFake implements _i4.Navigator {
  _FakeNavigator_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeBuildContext_3 extends _i1.SmartFake implements _i5.BuildContext {
  _FakeBuildContext_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWidget_4 extends _i1.SmartFake implements _i5.Widget {
  _FakeWidget_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_5 extends _i1.SmartFake
    implements _i3.DiagnosticsNode {
  _FakeDiagnosticsNode_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({
    _i3.TextTreeConfiguration? parentConfiguration,
    _i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info,
  }) =>
      super.toString();
}

class _FakeTicker_6 extends _i1.SmartFake implements _i6.Ticker {
  _FakeTicker_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({bool? debugIncludeStack = false}) => super.toString();
}

/// A class which mocks [GlobalKey].
///
/// See the documentation for Mockito's code generation for more information.
class MockGlobalKey<T extends _i5.State<_i5.StatefulWidget>> extends _i1.Mock
    implements _i5.GlobalKey<T> {
  MockGlobalKey() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [NavigatorState].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigatorState extends _i1.Mock implements _i4.NavigatorState {
  MockNavigatorState() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FocusNode get focusNode => (super.noSuchMethod(
        Invocation.getter(#focusNode),
        returnValue: _FakeFocusNode_0(
          this,
          Invocation.getter(#focusNode),
        ),
      ) as _i2.FocusNode);

  @override
  _i3.ValueNotifier<bool> get userGestureInProgressNotifier =>
      (super.noSuchMethod(
        Invocation.getter(#userGestureInProgressNotifier),
        returnValue: _FakeValueNotifier_1<bool>(
          this,
          Invocation.getter(#userGestureInProgressNotifier),
        ),
      ) as _i3.ValueNotifier<bool>);

  @override
  bool get userGestureInProgress => (super.noSuchMethod(
        Invocation.getter(#userGestureInProgress),
        returnValue: false,
      ) as bool);

  @override
  _i4.Navigator get widget => (super.noSuchMethod(
        Invocation.getter(#widget),
        returnValue: _FakeNavigator_2(
          this,
          Invocation.getter(#widget),
        ),
      ) as _i4.Navigator);

  @override
  _i5.BuildContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeBuildContext_3(
          this,
          Invocation.getter(#context),
        ),
      ) as _i5.BuildContext);

  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
      ) as bool);

  @override
  bool get restorePending => (super.noSuchMethod(
        Invocation.getter(#restorePending),
        returnValue: false,
      ) as bool);

  @override
  void initState() => super.noSuchMethod(
        Invocation.method(
          #initState,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void restoreState(
    _i7.RestorationBucket? oldBucket,
    bool? initialRestore,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #restoreState,
          [
            oldBucket,
            initialRestore,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didToggleBucket(_i7.RestorationBucket? oldBucket) => super.noSuchMethod(
        Invocation.method(
          #didToggleBucket,
          [oldBucket],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didChangeDependencies() => super.noSuchMethod(
        Invocation.method(
          #didChangeDependencies,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didUpdateWidget(_i5.StatefulWidget? oldWidget) => super.noSuchMethod(
        Invocation.method(
          #didUpdateWidget,
          [oldWidget],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void deactivate() => super.noSuchMethod(
        Invocation.method(
          #deactivate,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void activate() => super.noSuchMethod(
        Invocation.method(
          #activate,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<T?> pushNamed<T extends Object?>(
    String? routeName, {
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamed,
          [routeName],
          {#arguments: arguments},
        ),
        returnValue: _i8.Future<T?>.value(),
      ) as _i8.Future<T?>);

  @override
  String restorablePushNamed<T extends Object?>(
    String? routeName, {
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #restorablePushNamed,
          [routeName],
          {#arguments: arguments},
        ),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.method(
            #restorablePushNamed,
            [routeName],
            {#arguments: arguments},
          ),
        ),
      ) as String);

  @override
  _i8.Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String? routeName, {
    TO? result,
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushReplacementNamed,
          [routeName],
          {
            #result: result,
            #arguments: arguments,
          },
        ),
        returnValue: _i8.Future<T?>.value(),
      ) as _i8.Future<T?>);

  @override
  String restorablePushReplacementNamed<T extends Object?, TO extends Object?>(
    String? routeName, {
    TO? result,
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #restorablePushReplacementNamed,
          [routeName],
          {
            #result: result,
            #arguments: arguments,
          },
        ),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.method(
            #restorablePushReplacementNamed,
            [routeName],
            {
              #result: result,
              #arguments: arguments,
            },
          ),
        ),
      ) as String);

  @override
  _i8.Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String? routeName, {
    TO? result,
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #popAndPushNamed,
          [routeName],
          {
            #result: result,
            #arguments: arguments,
          },
        ),
        returnValue: _i8.Future<T?>.value(),
      ) as _i8.Future<T?>);

  @override
  String restorablePopAndPushNamed<T extends Object?, TO extends Object?>(
    String? routeName, {
    TO? result,
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #restorablePopAndPushNamed,
          [routeName],
          {
            #result: result,
            #arguments: arguments,
          },
        ),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.method(
            #restorablePopAndPushNamed,
            [routeName],
            {
              #result: result,
              #arguments: arguments,
            },
          ),
        ),
      ) as String);

  @override
  _i8.Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String? newRouteName,
    _i4.RoutePredicate? predicate, {
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [
            newRouteName,
            predicate,
          ],
          {#arguments: arguments},
        ),
        returnValue: _i8.Future<T?>.value(),
      ) as _i8.Future<T?>);

  @override
  String restorablePushNamedAndRemoveUntil<T extends Object?>(
    String? newRouteName,
    _i4.RoutePredicate? predicate, {
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #restorablePushNamedAndRemoveUntil,
          [
            newRouteName,
            predicate,
          ],
          {#arguments: arguments},
        ),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.method(
            #restorablePushNamedAndRemoveUntil,
            [
              newRouteName,
              predicate,
            ],
            {#arguments: arguments},
          ),
        ),
      ) as String);

  @override
  _i8.Future<T?> push<T extends Object?>(_i4.Route<T>? route) =>
      (super.noSuchMethod(
        Invocation.method(
          #push,
          [route],
        ),
        returnValue: _i8.Future<T?>.value(),
      ) as _i8.Future<T?>);

  @override
  String restorablePush<T extends Object?>(
    _i4.RestorableRouteBuilder<T>? routeBuilder, {
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #restorablePush,
          [routeBuilder],
          {#arguments: arguments},
        ),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.method(
            #restorablePush,
            [routeBuilder],
            {#arguments: arguments},
          ),
        ),
      ) as String);

  @override
  _i8.Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    _i4.Route<T>? newRoute, {
    TO? result,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushReplacement,
          [newRoute],
          {#result: result},
        ),
        returnValue: _i8.Future<T?>.value(),
      ) as _i8.Future<T?>);

  @override
  String restorablePushReplacement<T extends Object?, TO extends Object?>(
    _i4.RestorableRouteBuilder<T>? routeBuilder, {
    TO? result,
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #restorablePushReplacement,
          [routeBuilder],
          {
            #result: result,
            #arguments: arguments,
          },
        ),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.method(
            #restorablePushReplacement,
            [routeBuilder],
            {
              #result: result,
              #arguments: arguments,
            },
          ),
        ),
      ) as String);

  @override
  _i8.Future<T?> pushAndRemoveUntil<T extends Object?>(
    _i4.Route<T>? newRoute,
    _i4.RoutePredicate? predicate,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushAndRemoveUntil,
          [
            newRoute,
            predicate,
          ],
        ),
        returnValue: _i8.Future<T?>.value(),
      ) as _i8.Future<T?>);

  @override
  String restorablePushAndRemoveUntil<T extends Object?>(
    _i4.RestorableRouteBuilder<T>? newRouteBuilder,
    _i4.RoutePredicate? predicate, {
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #restorablePushAndRemoveUntil,
          [
            newRouteBuilder,
            predicate,
          ],
          {#arguments: arguments},
        ),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.method(
            #restorablePushAndRemoveUntil,
            [
              newRouteBuilder,
              predicate,
            ],
            {#arguments: arguments},
          ),
        ),
      ) as String);

  @override
  void replace<T extends Object?>({
    required _i4.Route<dynamic>? oldRoute,
    required _i4.Route<T>? newRoute,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #replace,
          [],
          {
            #oldRoute: oldRoute,
            #newRoute: newRoute,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  String restorableReplace<T extends Object?>({
    required _i4.Route<dynamic>? oldRoute,
    required _i4.RestorableRouteBuilder<T>? newRouteBuilder,
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #restorableReplace,
          [],
          {
            #oldRoute: oldRoute,
            #newRouteBuilder: newRouteBuilder,
            #arguments: arguments,
          },
        ),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.method(
            #restorableReplace,
            [],
            {
              #oldRoute: oldRoute,
              #newRouteBuilder: newRouteBuilder,
              #arguments: arguments,
            },
          ),
        ),
      ) as String);

  @override
  void replaceRouteBelow<T extends Object?>({
    required _i4.Route<dynamic>? anchorRoute,
    required _i4.Route<T>? newRoute,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #replaceRouteBelow,
          [],
          {
            #anchorRoute: anchorRoute,
            #newRoute: newRoute,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  String restorableReplaceRouteBelow<T extends Object?>({
    required _i4.Route<dynamic>? anchorRoute,
    required _i4.RestorableRouteBuilder<T>? newRouteBuilder,
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #restorableReplaceRouteBelow,
          [],
          {
            #anchorRoute: anchorRoute,
            #newRouteBuilder: newRouteBuilder,
            #arguments: arguments,
          },
        ),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.method(
            #restorableReplaceRouteBelow,
            [],
            {
              #anchorRoute: anchorRoute,
              #newRouteBuilder: newRouteBuilder,
              #arguments: arguments,
            },
          ),
        ),
      ) as String);

  @override
  bool canPop() => (super.noSuchMethod(
        Invocation.method(
          #canPop,
          [],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i8.Future<bool> maybePop<T extends Object?>([T? result]) =>
      (super.noSuchMethod(
        Invocation.method(
          #maybePop,
          [result],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  void pop<T extends Object?>([T? result]) => super.noSuchMethod(
        Invocation.method(
          #pop,
          [result],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void popUntil(_i4.RoutePredicate? predicate) => super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeRoute(_i4.Route<dynamic>? route) => super.noSuchMethod(
        Invocation.method(
          #removeRoute,
          [route],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeRouteBelow(_i4.Route<dynamic>? anchorRoute) => super.noSuchMethod(
        Invocation.method(
          #removeRouteBelow,
          [anchorRoute],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void finalizeRoute(_i4.Route<dynamic>? route) => super.noSuchMethod(
        Invocation.method(
          #finalizeRoute,
          [route],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didStartUserGesture() => super.noSuchMethod(
        Invocation.method(
          #didStartUserGesture,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didStopUserGesture() => super.noSuchMethod(
        Invocation.method(
          #didStopUserGesture,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Widget build(_i5.BuildContext? context) => (super.noSuchMethod(
        Invocation.method(
          #build,
          [context],
        ),
        returnValue: _FakeWidget_4(
          this,
          Invocation.method(
            #build,
            [context],
          ),
        ),
      ) as _i5.Widget);

  @override
  void reassemble() => super.noSuchMethod(
        Invocation.method(
          #reassemble,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setState(_i10.VoidCallback? fn) => super.noSuchMethod(
        Invocation.method(
          #setState,
          [fn],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void debugFillProperties(_i3.DiagnosticPropertiesBuilder? properties) =>
      super.noSuchMethod(
        Invocation.method(
          #debugFillProperties,
          [properties],
        ),
        returnValueForMissingStub: null,
      );

  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();

  @override
  String toStringShort() => (super.noSuchMethod(
        Invocation.method(
          #toStringShort,
          [],
        ),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.method(
            #toStringShort,
            [],
          ),
        ),
      ) as String);

  @override
  _i3.DiagnosticsNode toDiagnosticsNode({
    String? name,
    _i3.DiagnosticsTreeStyle? style,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #toDiagnosticsNode,
          [],
          {
            #name: name,
            #style: style,
          },
        ),
        returnValue: _FakeDiagnosticsNode_5(
          this,
          Invocation.method(
            #toDiagnosticsNode,
            [],
            {
              #name: name,
              #style: style,
            },
          ),
        ),
      ) as _i3.DiagnosticsNode);

  @override
  _i6.Ticker createTicker(_i6.TickerCallback? onTick) => (super.noSuchMethod(
        Invocation.method(
          #createTicker,
          [onTick],
        ),
        returnValue: _FakeTicker_6(
          this,
          Invocation.method(
            #createTicker,
            [onTick],
          ),
        ),
      ) as _i6.Ticker);

  @override
  void registerForRestoration(
    _i11.RestorableProperty<Object?>? property,
    String? restorationId,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #registerForRestoration,
          [
            property,
            restorationId,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void unregisterFromRestoration(_i11.RestorableProperty<Object?>? property) =>
      super.noSuchMethod(
        Invocation.method(
          #unregisterFromRestoration,
          [property],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didUpdateRestorationId() => super.noSuchMethod(
        Invocation.method(
          #didUpdateRestorationId,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [BottomSheetRouteGenerator].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetRouteGenerator extends _i1.Mock
    implements _i12.BottomSheetRouteGenerator {
  MockBottomSheetRouteGenerator() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Map<String, _i12.BottomSheetRoute> generateRoute() => (super.noSuchMethod(
        Invocation.method(
          #generateRoute,
          [],
        ),
        returnValue: <String, _i12.BottomSheetRoute>{},
      ) as Map<String, _i12.BottomSheetRoute>);
}
