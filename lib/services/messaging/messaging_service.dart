import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:boomerang_pos/app/data/order.dart';
import 'package:boomerang_pos/app/data/user_model.dart';
import 'package:boomerang_pos/components/order_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/instance_manager.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'dart:ui' as ui;

class MessagingService {
  final FirebaseMessaging _firebaseMessaging = Get.find<FirebaseMessaging>();
  static MessagingService get instance => Get.find();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? _token;

  String? get token => _token;
  StreamSubscription? _fcmTokenSubscribtion;

  Future<MessagingService> init() async {
    final settings = await _requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      _token = await _firebaseMessaging.getToken();
      log("FCM: $_token");
      if (_token != null) _setToken(_token!);
      _setTokenListener();
      _registerForegroundMessageHandler();
    }

    _firebaseAuth.authStateChanges().listen((user) async {
      final token = await _firebaseMessaging.getToken();
      _token = token;
      if (token != null) _setToken(token);
      if ((user?.email?.isNotEmpty ?? false) &&
          user!.email!.endsWith('@restaurant-boomerang.kg')) {
        _firebaseMessaging.subscribeToTopic(user.email!);
      }
    });
    return this;
  }

  Future _setTokenListener() async {
    _fcmTokenSubscribtion?.cancel();
    _fcmTokenSubscribtion = _firebaseMessaging.onTokenRefresh.listen(_setToken);
  }

  _setToken(String token) {
    _token = token;
    final user = _firebaseAuth.currentUser;
    log('Current user: $user');
    if (user == null) return;
    usersRef.doc(user.uid).deviceTokens.doc(token).set(
          UserDeviceTokens(
            token: token,
            createdAt: Timestamp.now(),
            platform: 'android',
          ),
        );
  }

  Future<NotificationSettings> _requestPermission() async {
    return await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      announcement: false,
    );
  }

  void _registerForegroundMessageHandler() {
    log("Init Messaging listener, _registerForegroundMessageHandler");
    FirebaseMessaging.onMessage.listen(onRemoteMessage, onError: (e) {
      log("Foreground Messaging error: $e");
    }, onDone: () {
      log("Foreground Messaging done");
    });
  }
}

Future<Uint8List?> createImageFromWidget(
  Widget widget, {
  Duration? wait,
  Size? logicalSize,
  Size? imageSize,
}) async {
  log("createImageFromWidget(): new RenderRepaintBoundary()");
  final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

  logicalSize = Size(360.0, 592.0);
  imageSize = Size(720.0, 1184.0);
  log("createImageFromWidget(): logicalSize: $logicalSize, imageSize: $imageSize");

  assert(logicalSize.aspectRatio == imageSize.aspectRatio);
  late RenderView renderView;
  try {
    log("createImageFromWidget(): new RenderView()");
    renderView = RenderView(
      window: ui.window,
      child: RenderPositionedBox(
          alignment: Alignment.center, child: repaintBoundary),
      configuration: ViewConfiguration(
        size: logicalSize,
        devicePixelRatio: 1.0,
      ),
    );
  } catch (e) {
    log("Error when try to create RenderView: $e");
    rethrow;
  }
  log("createImageFromWidget(): new PipelineOwner()");
  final PipelineOwner pipelineOwner = PipelineOwner();
  log("createImageFromWidget(): new BuildOwner()");
  final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager.instance);
  log("createImageFromWidget(): pipelineOwner.rootNode = renderView;");

  pipelineOwner.rootNode = renderView;
  log("createImageFromWidget(): renderView.prepareInitialFrame()");
  renderView.prepareInitialFrame();

  log("createImageFromWidget(): new RenderObjectToWidgetElement()");
  final RenderObjectToWidgetElement<RenderBox> rootElement =
      RenderObjectToWidgetAdapter<RenderBox>(
    container: repaintBoundary,
    child: widget,
  ).attachToRenderTree(buildOwner);

  buildOwner.buildScope(rootElement);

  if (wait != null) {
    await Future.delayed(wait);
  }

  buildOwner.buildScope(rootElement);
  buildOwner.finalizeTree();

  pipelineOwner.flushLayout();
  pipelineOwner.flushCompositingBits();
  pipelineOwner.flushPaint();

  final ui.Image image = await repaintBoundary.toImage(
      pixelRatio: imageSize.width / logicalSize.width);
  final ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);

  return byteData?.buffer.asUint8List();
}

Future<void> printOrder(String orderId) async {
  try {
    await SunmiPrinter.bindingPrinter();
    await SunmiPrinter.initPrinter();
    await SunmiPrinter.startTransactionPrint(true);

    final orderSnap = await ordersRef.doc(orderId).get();
    final Order? order = orderSnap.data;
    if (order == null) return;
    log("Creating image...");
    final img = await createImageFromWidget(
      OrderWidget(order: order),
    );

    if (img != null) {
      log("Image: type: ${img.runtimeType}, bytes: ${img.lengthInBytes}");
      log("Printing image...");
      await SunmiPrinter.printImage(img);
      log("Image printed!!!");
    }

    await SunmiPrinter.lineWrap(2);
    await SunmiPrinter.line();
    await SunmiPrinter.lineWrap(2);
    await SunmiPrinter.cut();
    await SunmiPrinter.exitTransactionPrint(true);
  } catch (e) {
    log("printOrder error: $e");
  }
}

onRemoteMessage(RemoteMessage remoteMessage) async {
  log(" --- foreground message received ---");

  log('${remoteMessage.notification!.title}');
  log('${remoteMessage.notification!.body}');
  log('${remoteMessage.data}, type: ${remoteMessage.data.runtimeType}');

  final messageData = Map<String, String?>.from(remoteMessage.data);

  // showSimpleNotification(
  //   Text('${remoteMessage.notification!.title}'),
  //   subtitle: Text('${remoteMessage.notification!.body}'),
  //   background: Colors.white,
  //   duration: const Duration(seconds: 2),
  // );

  final messageType = messageData['type'];
  final outputId = messageData['outputId'];
  final orderId = messageData['orderId'];

  log('messageType: $messageType, outputId: $outputId}');

  if (messageType != 'pos-terminal' || orderId == null) return;
  try {
    await printOrder(orderId);
  } catch (e) {
    log('Print error: $e');
  }
}
