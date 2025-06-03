import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart' as a;
import 'package:ui/src/extensions/app_extentions.dart';

enum AnimateType {
  fadeInUp,
  slideInUp,
  bounceInUp,

  fadeInDown,
  slideInDown,
  fadeInLeft,
  fadeInRight,

  slideInLeft,
  slideInRight,

  bounceInDown,
  bounceInLeft,
  bounceInRight,

  elasticIn,
  elasticInDown,
  elasticInUp,
  elasticInLeft,
  elasticInRight,

  flipInX,
  flipInY,
  zoomIn,

  jelloIn,
  flash,
  bounce,
  pulse,
  swing,
  spin,
  spinPerfect,
  dance,
  roulette,
  moveY,
  fade,
  moveX,

  none,
  random,
}

class AppAnimations {
  static bool get disable => false.if_release(false);
  static double get speed => 1;
  static Duration get duration_toast => Duration(seconds: 3);
  static Duration get duration_ms200 =>
      disable ? 0.seconds : (200 * speed).milliseconds;
  static Duration get duration_ms400 =>
      disable ? 0.seconds : (400 * speed).milliseconds;
  static Duration get duration_ms700 =>
      disable ? 0.seconds : (700 * speed).milliseconds;
  static Duration get duration_s1 =>
      disable ? 0.seconds : (1 * speed * 1000).toInt().milliseconds;
  static Duration get duration_s2 =>
      disable ? 0.seconds : (2 * speed * 1000).toInt().milliseconds;
  static Duration get duration_s3 =>
      disable ? 0.seconds : (3 * speed * 1000).toInt().milliseconds;
  static Duration get none => disable ? 0.seconds : 0.seconds;
  static Duration get duration_s1_2 =>
      disable ? 0.seconds : (1.2 * speed * 1000).toInt().milliseconds;
  static Duration get duration_s1_5 =>
      disable ? 0.seconds : (1.5 * speed * 1000).toInt().milliseconds;
  static Duration get duration_s20 =>
      disable ? 0.seconds : (20 * speed * 1000).toInt().milliseconds;

  static Duration get delay_ms400 =>
      disable ? 0.seconds : Duration(milliseconds: (400).toInt());
  static Duration get delay_list_ms400 =>
      disable ? 0.seconds : Duration(milliseconds: (400).toInt());
  static Duration get delay_s1 =>
      disable ? 0.seconds : (1 * 1000).toInt().milliseconds;
  static Duration get delay_s1_2 =>
      disable ? 0.seconds : (1.2 * 1000).toInt().milliseconds;

  static double get delay_s3 => disable ? 0 : (4000 * speed);
}

randomAnimaitonFixed() {
  var v = List.from(AnimateType.values);
  v.removeLast();
  v.removeLast();

  return (v..shuffle()).first;
}

randomAnimaitonFixedList() {
  var v = List.from(AnimateType.values);
  v.removeRange(3, v.length);
  return (v..shuffle()).first;
}

bool repeated = false;
var stopAnimation = false;

//double zoom_from=30;
extension AnimationExtentions on Widget {
  Widget setAnimation(AnimateType typeParm,
      {bool animate = true,
      Duration? delay,
      double moveY = 1000,
      double moveX = 500,
      bool withDelay = true,
      Duration? duration,
      bool repeated = false,
      bool,
      Function(AnimationController)? controller,
      double from = 100}) {
    var typ =
        typeParm == AnimateType.random ? randomAnimaitonFixed() : typeParm;

    return typeParm == AnimateType.none ||
            AppAnimations.disable ||
            stopAnimation
        ? this
        : typ == AnimateType.fade
            ? this
                .animate(
                  delay: delay ??
                      (withDelay == true
                          ? AppAnimations.delay_ms400
                          : AppAnimations.none),
                )
                .fade(
                    delay: delay ??
                        (withDelay == true
                            ? AppAnimations.delay_ms400
                            : AppAnimations.none),
                    duration: duration ??
                        AppAnimations
                            .duration_ms400) // runs after teh above w/new duration
            : typ == AnimateType.moveY
                ? this
                    .animate(
                      delay: delay ??
                          (withDelay == true
                              ? AppAnimations.delay_ms400
                              : AppAnimations.none),
                    )
                    .moveY(
                        delay: 300.ms,
                        duration: 600.ms,
                        begin: -moveY,
                        end: 0) // runs after teh above w/new duration
                : typ == AnimateType.moveX
                    ? this.animate().moveX(
                        delay: 300.ms,
                        duration: 600.ms,
                        begin: -moveX,
                        end: 0) // runs after teh above w/new duration

                    : typ == AnimateType.elasticIn
                        ? ElasticIn(
                            delay: delay ??
                                (withDelay == true
                                    ? AppAnimations.delay_ms400
                                    : AppAnimations.none),
                            duration: duration ?? AppAnimations.duration_ms400,
                            animate: animate,
                            controller: controller,
                            child: this)
                        : typ == AnimateType.elasticInDown
                            ? ElasticInDown(
                                delay: delay ??
                                    (withDelay == true
                                        ? AppAnimations.delay_ms400
                                        : AppAnimations.none),
                                duration:
                                    duration ?? AppAnimations.duration_ms400,
                                animate: animate,
                                controller: controller,
                                child: this)
                            : typ == AnimateType.elasticInLeft
                                ? ElasticInLeft(
                                    delay: delay ??
                                        (withDelay == true
                                            ? AppAnimations.delay_ms400
                                            : AppAnimations.none),
                                    duration: duration ??
                                        AppAnimations.duration_ms400,
                                    animate: animate,
                                    controller: controller,
                                    child: this)
                                : typ == AnimateType.elasticInRight
                                    ? ElasticInRight(
                                        delay: delay ??
                                            (withDelay == true
                                                ? AppAnimations.delay_ms400
                                                : AppAnimations.none),
                                        duration: duration ??
                                            AppAnimations.duration_ms400,
                                        animate: animate,
                                        controller: controller,
                                        child: this)
                                    : typ == AnimateType.slideInDown
                                        ? SlideInDown(
                                            delay: delay ??
                                                (withDelay == true
                                                    ? AppAnimations.delay_ms400
                                                    : AppAnimations.none),
                                            duration: duration ??
                                                AppAnimations.duration_ms400,
                                            animate: animate,
                                            controller: controller,
                                            child: this)
                                        : typ == AnimateType.slideInDown
                                            ? SlideInDown(
                                                delay: delay ??
                                                    (withDelay == true
                                                        ? AppAnimations
                                                            .delay_ms400
                                                        : AppAnimations.none),
                                                duration: duration ??
                                                    AppAnimations
                                                        .duration_ms400,
                                                animate: animate,
                                                controller: controller,
                                                child: this)
                                            : typ == AnimateType.slideInUp
                                                ? SlideInUp(
                                                    delay: delay ??
                                                        (withDelay == true
                                                            ? AppAnimations
                                                                .delay_ms400
                                                            : AppAnimations
                                                                .none),
                                                    duration: duration ??
                                                        AppAnimations
                                                            .duration_ms400,
                                                    animate: animate,
                                                    controller: controller,
                                                    child: this)
                                                : typ == AnimateType.slideInLeft
                                                    ? SlideInLeft(
                                                        delay: delay ??
                                                            (withDelay == true
                                                                ? AppAnimations
                                                                    .delay_ms400
                                                                : AppAnimations
                                                                    .none),
                                                        duration: duration ??
                                                            AppAnimations
                                                                .duration_ms400,
                                                        animate: animate,
                                                        controller: controller,
                                                        child: this)
                                                    : typ ==
                                                            AnimateType
                                                                .slideInRight
                                                        ? SlideInRight(
                                                            delay: delay ??
                                                                (withDelay == true
                                                                    ? AppAnimations
                                                                        .delay_ms400
                                                                    : AppAnimations
                                                                        .none),
                                                            duration: duration ??
                                                                AppAnimations
                                                                    .duration_ms400,
                                                            animate: animate,
                                                            controller:
                                                                controller,
                                                            child: this)
                                                        : typ ==
                                                                AnimateType
                                                                    .flipInX
                                                            ? FlipInX(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, controller: controller, child: this)
                                                            : typ == AnimateType.flipInY
                                                                ? FlipInY(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, controller: controller, child: this)
                                                                : typ == AnimateType.zoomIn
                                                                    ? ZoomIn(
                                                                        delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none),
                                                                        duration: duration ?? AppAnimations.duration_ms400,
                                                                        animate: animate,
                                                                        controller: controller,
                                                                        //
                                                                        child: this)
                                                                    : typ == AnimateType.flash
                                                                        ? Flash(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, infinite: repeated, animate: animate, controller: controller, child: this)
                                                                        : typ == AnimateType.jelloIn
                                                                            ? JelloIn(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, controller: controller, child: this)
                                                                            : typ == AnimateType.pulse
                                                                                ? Pulse(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, controller: controller, child: this)
                                                                                : typ == AnimateType.swing
                                                                                    ? Swing(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, controller: controller, child: this)
                                                                                    : typ == AnimateType.spin
                                                                                        ? Spin(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, controller: controller, child: this)
                                                                                        : typ == AnimateType.spinPerfect
                                                                                            ? SpinPerfect(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, controller: controller, child: this)
                                                                                            : typ == AnimateType.dance
                                                                                                ? Dance(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, controller: controller, child: this)
                                                                                                : typ == AnimateType.bounce
                                                                                                    ? Bounce(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, controller: controller, child: this)
                                                                                                    : typ == AnimateType.roulette
                                                                                                        ? Roulette(
                                                                                                            delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none),
                                                                                                            duration: duration ?? AppAnimations.duration_ms400,
                                                                                                            animate: animate,
                                                                                                            controller: controller,
                                                                                                            infinite: repeated,
                                                                                                            child: this,
                                                                                                          )
                                                                                                        : typ == AnimateType.bounceInDown
                                                                                                            ? BounceInDown(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, controller: controller, child: this)
                                                                                                            : typ == AnimateType.bounceInUp
                                                                                                                ? BounceInUp(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, controller: controller, child: this)
                                                                                                                : typ == AnimateType.bounceInLeft
                                                                                                                    ? BounceInLeft(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, controller: controller, child: this)
                                                                                                                    : typ == AnimateType.bounceInRight
                                                                                                                        ? BounceInRight(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, controller: controller, child: this)
                                                                                                                        : typ == AnimateType.fadeInDown
                                                                                                                            ? FadeInDown(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, controller: controller, animate: animate, child: this)
                                                                                                                            : typ == AnimateType.fadeInUp
                                                                                                                                ? FadeInUp(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, controller: controller, animate: animate, child: this)
                                                                                                                                : typ == AnimateType.fadeInLeft
                                                                                                                                    ? FadeInLeft(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, animate: animate, child: this)
                                                                                                                                    : typ == AnimateType.fadeInRight
                                                                                                                                        ? FadeInRight(delay: delay ?? (withDelay == true ? AppAnimations.delay_ms400 : AppAnimations.none), duration: duration ?? AppAnimations.duration_ms400, controller: controller, animate: animate, child: this)
                                                                                                                                        : this;
  }
}
