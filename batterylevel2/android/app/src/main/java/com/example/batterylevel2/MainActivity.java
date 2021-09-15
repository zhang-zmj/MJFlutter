package com.example.batterylevel2;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodChannel;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "coderwhy.com/battery";

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    // 1.创建MethodChannel对象
    MethodChannel methodChannel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL);

    // 2.添加调用方法的回调
    methodChannel.setMethodCallHandler(
        (call, result) -> {
          // 2.1.如果调用的方法是getBatteryInfo,那么正常执行
          if (call.method.equals("getBatteryInfo")) {

            // 2.1.1.调用另外一个自定义方法回去电量信息
            int batteryLevel = getBatteryLevel();

            // 2.1.2. 判断是否正常获取到
            if (batteryLevel != -1) {
              // 获取到返回结果
              result.success(batteryLevel);
            } else {
              // 获取不到抛出异常
              result.error("UNAVAILABLE", "Battery level not available.", null);
            }
          } else {
            // 2.2.如果调用的方法是getBatteryInfo,那么正常执行
            result.notImplemented();
          }
        }
      );
    }

  private int getBatteryLevel() {
    int batteryLevel = -1;
    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    } else {
      Intent intent = new ContextWrapper(getApplicationContext()).
              registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
      batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
              intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
    }

    return batteryLevel;
  }
}
