import 'dart:async';

import 'package:flutter/services.dart';
import 'Ironsource_consts.dart';
import 'models.dart';
export 'banner.dart';

class IronSource {
  static const MethodChannel _channel =
      MethodChannel("com.metamorfosis_labs.flutter_ironsource_x");
  static IronSourceListener? _listener;
  static IronSourceListener? getListener() {
    return _listener!;
  }

  static FutureOr<dynamic> initialize({
    final String? appKey,
    final IronSourceListener? listener,
    bool gdprConsent = true,
    bool ccpaConsent = true,
  }) async {
    _listener = listener;
    _channel.setMethodCallHandler(_listener?._handle);
    await _channel.invokeMethod('initialize', {
      'appKey': appKey,
      'gdprConsent': gdprConsent,
      'ccpaConsent': ccpaConsent
    });
  }

  static Future<dynamic> shouldTrackNetworkState(bool state) async {
    await _channel.invokeMethod('shouldTrackNetworkState', {'state': state});
  }

  static Future<dynamic> validateIntegration() async {
    await _channel.invokeMethod('validateIntegration');
  }

  static Future<dynamic> setUserId(String userId) async {
    await _channel.invokeMethod('setUserId', {'userId': userId});
  }

  static Future<dynamic> getAdvertiserId() async {
    return await _channel.invokeMethod('getAdvertiserId');
  }

  static Future<dynamic> loadInterstitial() async {
    await _channel.invokeMethod('loadInterstitial');
  }

  static Future<dynamic> showInterstitial() async {
    await _channel.invokeMethod('showInterstitial');
  }

  static Future<dynamic> showRewardedVideo() async {
    await _channel.invokeMethod('showRewardedVideo');
  }

  static Future<dynamic> showOfferwall() async {
    await _channel.invokeMethod('showOfferwall');
  }

  static Future<dynamic> isInterstitialReady() async {
    return await _channel.invokeMethod('isInterstitialReady');
  }

  static Future<dynamic> activityResumed() async {
    await _channel.invokeMethod('activityResumed');
  }

  static Future<dynamic> activityPaused() async {
    await _channel.invokeMethod('activityPaused');
  }

  static Future<dynamic> isRewardedVideoAvailable() async {
    return await _channel.invokeMethod('isRewardedVideoAvailable');
  }

  static Future<dynamic> isOfferwallAvailable() async {
    return await _channel.invokeMethod('isOfferwallAvailable');
  }
}

abstract class IronSourceListener {
  Future<dynamic> _handle(MethodCall call) async {
    if (call.method == ON_INTERSTITIAL_AD_CLICKED) {
      onInterstitialAdClicked();
    } else if (call.method == ON_INTERSTITIAL_AD_CLOSED) {
      onInterstitialAdClosed();
    } else if (call.method == ON_INTERSTITIAL_AD_OPENED) {
      onInterstitialAdOpened();
    } else if (call.method == ON_INTERSTITIAL_AD_READY) {
      onInterstitialAdReady();
    } else if (call.method == ON_INTERSTITIAL_AD_SHOW_SUCCEEDED) {
      onInterstitialAdShowSucceeded();
    } else if (call.method == ON_INTERSTITIAL_AD_LOAD_FAILED) {
      onInterstitialAdLoadFailed(IronSourceError(
          errorCode: call.arguments["errorCode"],
          errorMessage: call.arguments["errorMessage"]));
    } else if (call.method == ON_INTERSTITIAL_AD_SHOW_FAILED) {
      onInterstitialAdShowFailed(IronSourceError(
          errorCode: call.arguments["errorCode"],
          errorMessage: call.arguments["errorMessage"]));
    } else if (call.method == ON_REWARDED_VIDEO_AD_CLICKED) {
      onRewardedVideoAdClicked(Placement(
          placementId: call.arguments["placementid"],
          placementName: call.arguments["placementName"],
          rewardAmount: call.arguments["rewardAmount"],
          rewardName: call.arguments["rewardName"]));
    } else if (call.method == ON_REWARDED_VIDEO_AD_CLOSED) {
      onRewardedVideoAdClosed();
    } else if (call.method == ON_REWARDED_VIDEO_AD_ENDED) {
      onRewardedVideoAdEnded();
    } else if (call.method == ON_REWARDED_VIDEO_AD_OPENED) {
      onRewardedVideoAdOpened();
    } else if (call.method == ON_REWARDED_VIDEO_AD_REWARDED) {
      onRewardedVideoAdRewarded(Placement(
          placementId: call.arguments["placementid"],
          placementName: call.arguments["placementName"],
          rewardAmount: call.arguments["rewardAmount"],
          rewardName: call.arguments["rewardName"]));
    } else if (call.method == ON_REWARDED_VIDEO_AD_SHOW_FAILED) {
      onRewardedVideoAdShowFailed(
        IronSourceError(
            errorCode: call.arguments["errorCode"],
            errorMessage: call.arguments["errorMessage"]),
      );
    } else if (call.method == ON_REWARDED_VIDEO_AVAILABILITY_CHANGED) {
      onRewardedVideoAvailabilityChanged(call.arguments);
    } else if (call.method == ON_REWARDED_VIDEO_AD_STARTED) {
      onRewardedVideoAdStarted();
    } else if (call.method == ON_OFFERWALL_AD_CREDITED) {
      onOfferwallAdCredited(OfferwallCredit(
          credits: call.arguments["credits"],
          totalCredits: call.arguments["totalCredits"],
          totalCreditsFlag: call.arguments["totalCreditsFlag"]));
    } else if (call.method == ON_OFFERWALL_AVAILABLE) {
      onOfferwallAvailable(call.arguments);
    } else if (call.method == ON_OFFERWALL_CLOSED) {
      onOfferwallClosed();
    } else if (call.method == ON_OFFERWALL_CREDITS_FAILED) {
      onGetOfferwallCreditsFailed(IronSourceError(
          errorCode: call.arguments["errorCode"],
          errorMessage: call.arguments["errorMessage"]));
    } else if (call.method == ON_OFFERWALL_OPENED) {
      onOfferwallOpened();
    } else if (call.method == ON_OFFERWALL_SHOW_FAILED) {
      onOfferwallShowFailed(IronSourceError(
          errorCode: call.arguments["errorCode"],
          errorMessage: call.arguments["errorMessage"]));
    }
  }


  void onGetOfferwallCreditsFailed(IronSourceError error) {
    // TODO: implement onGetOfferwallCreditsFailed
  }


  void onInterstitialAdClicked() {
    // TODO: implement onInterstitialAdClicked
  }

  void onInterstitialAdClosed() {
    // TODO: implement onInterstitialAdClosed
  }


  void onInterstitialAdLoadFailed(IronSourceError error) {
    // TODO: implement onInterstitialAdLoadFailed
  }


  void onInterstitialAdOpened() {
    // TODO: implement onInterstitialAdOpened
  }


  void onInterstitialAdReady() {
    // TODO: implement onInterstitialAdReady
  }

  void onInterstitialAdShowFailed(IronSourceError error) {
    // TODO: implement onInterstitialAdShowFailed
  }


  void onInterstitialAdShowSucceeded() {
    // TODO: implement onInterstitialAdShowSucceeded
  }


  void onOfferwallAdCredited(OfferwallCredit reward) {
    // TODO: implement onOfferwallAdCredited
  }


  void onOfferwallAvailable(bool available) {
    // TODO: implement onOfferwallAvailable
  }


  void onOfferwallClosed() {
    // TODO: implement onOfferwallClosed
  }


  void onOfferwallOpened() {
    // TODO: implement onOfferwallOpened
  }


  void onOfferwallShowFailed(IronSourceError error) {
    // TODO: implement onOfferwallShowFailed
  }


  void onRewardedVideoAdClicked(Placement placement) {
    // TODO: implement onRewardedVideoAdClicked
  }


  void onRewardedVideoAdClosed() {
    // TODO: implement onRewardedVideoAdClosed
  }


  void onRewardedVideoAdEnded() {
    // TODO: implement onRewardedVideoAdEnded
  }

  void onRewardedVideoAdOpened() {
    // TODO: implement onRewardedVideoAdOpened
  }


  void onRewardedVideoAdRewarded(Placement placement) {
    // TODO: implement onRewardedVideoAdRewarded
  }


  void onRewardedVideoAdShowFailed(IronSourceError error) {
    // TODO: implement onRewardedVideoAdShowFailed
  }


  void onRewardedVideoAdStarted() {
    // TODO: implement onRewardedVideoAdStarted
  }


  void onRewardedVideoAvailabilityChanged(bool available) {
    // TODO: implement onRewardedVideoAvailabilityChanged
  }
}
