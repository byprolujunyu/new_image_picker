 Xpackage ljy.com.flutterpicker;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;

import net.arvin.selector.SelectorHelper;
import net.arvin.selector.data.ConstantData;

import java.util.ArrayList;
import java.util.List;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class ImagePickerDelegate implements PluginRegistry.ActivityResultListener, PluginRegistry.RequestPermissionsResultListener {

    private MethodChannel.Result pendingResult;
    private MethodCall methodCall;
    private static final String TAG = "ImagePickerDelegate";

    private final Activity activity;

    public ImagePickerDelegate(Activity activity) {
        this.activity = activity;
    }

    void chooseImageFromGallery(MethodCall methodCall, MethodChannel.Result result) {
        this.methodCall = methodCall;
        this.pendingResult = result;
        SelectorHelper.selectPictures(activity, 9,
                true, new ArrayList(), 1001);
    }

    @Override
    public boolean onActivityResult(int i, int i1, Intent data) {
        Log.d(TAG, "onActivityResult: ");
        if (data == null){
            pendingResult.error("","",new RuntimeException());
            return false;
        }
        List<String> backPics = data.getStringArrayListExtra(ConstantData.KEY_BACK_PICTURES);
        pendingResult.success(backPics);
        return false;
    }

    @Override
    public boolean onRequestPermissionsResult(int i, String[] strings, int[] ints) {
        return false;
    }
}
