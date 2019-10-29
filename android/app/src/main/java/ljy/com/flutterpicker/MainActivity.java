package ljy.com.flutterpicker;

import android.Manifest;
import android.content.ContentResolver;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.net.Uri;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.util.Log;

import net.arvin.selector.SelectorHelper;
import net.arvin.selector.data.ConstantData;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.io/battery";
    private static final String CHANNEL1 = "samples.flutter.io/ablum";
    private static final String CHANNEL2 = "samples.flutter.io/ablum_result";
    private static final int REQUEST_ALBUM_OK = 100;
    private ArrayList<String> selectedPictures = new ArrayList<>();
    private static final String TAG = "MainActivity";
    Intent data;
    MethodChannel.Result result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        ImagePickerPlugin.registerWith(registrarFor("plugins.flutter.io/image_picker"));
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            requestPermissions(new String[]{Manifest.permission.READ_EXTERNAL_STORAGE,Manifest.permission.WRITE_EXTERNAL_STORAGE},1);
        }
    }

    //    private void getAblum(MethodChannel.Result result) {
//        //   this.result = result;
//        SelectorHelper.selectPictures(MainActivity.this, 9,
//               true, selectedPictures, 1001);
//    }
//
//    private void sendResult(Object o) {
//        new MethodChannel(getFlutterView(), CHANNEL1).invokeMethod("getResult", o);
//    }
//
//    @Override
//    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
//        if (resultCode != RESULT_OK) {
//            return;
//        }
//        if (requestCode == 1001) {
//            List<String> backPics = data.getStringArrayListExtra(ConstantData.KEY_BACK_PICTURES);
//            if (backPics != null && backPics.size() > 0) {
//                selectedPictures.clear();
//                selectedPictures.addAll(backPics);
//                sendResult(selectedPictures);
//            }
//        }
//    }


}
