package ljy.com.flutterpicker;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.support.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class ImagePickerPlugin implements MethodChannel.MethodCallHandler {

    static final String METHOD_CALL_IMAGE = "pickImage";
    static final String METHOD_CALL_VIDEO = "pickVideo";
    private static final String METHOD_CALL_RETRIEVE = "retrieve";
    private static final String CHANNEL = "plugins.flutter.io/image_picker";
    private PluginRegistry.Registrar registrar;
    private ImagePickerDelegate delegate;
    private Application.ActivityLifecycleCallbacks activityLifecycleCallbacks;

    public static void registerWith(PluginRegistry.Registrar registrar) {
        if (registrar.activity() == null) {
            // If a background flutter view tries to register the plugin, there will be no activity from the registrar,
            // we stop the registering process immediately because the ImagePicker requires an activity.
            return;
        }
        final MethodChannel channel = new MethodChannel(registrar.messenger(), CHANNEL);
        //final File externalFilesDirectory = registrar.activity().getExternalFilesDir(Environment.DIRECTORY_PICTURES);
        //final ExifDataCopier exifDataCopier = new ExifDataCopier();
        //final ImageResizer imageResizer = new ImageResizer(externalFilesDirectory, exifDataCopier);
        final ImagePickerDelegate delegate = new ImagePickerDelegate(registrar.activity());
        registrar.addActivityResultListener(delegate);
        registrar.addRequestPermissionsResultListener(delegate);
        final ImagePickerPlugin instance = new ImagePickerPlugin(registrar, delegate);
        channel.setMethodCallHandler(instance);
    }

    ImagePickerPlugin(final PluginRegistry.Registrar registrar, final ImagePickerDelegate delegate) {
        this.registrar = registrar;
        this.delegate = delegate;
        this.activityLifecycleCallbacks = new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {

            }

            @Override
            public void onActivityStarted(Activity activity) {

            }

            @Override
            public void onActivityResumed(Activity activity) {

            }

            @Override
            public void onActivityPaused(Activity activity) {

            }

            @Override
            public void onActivityStopped(Activity activity) {

            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {

            }

            @Override
            public void onActivityDestroyed(Activity activity) {
                if (activity == registrar.activity()
                        && registrar.activity().getApplicationContext() != null) {
                    ((Application) registrar.activity().getApplicationContext())
                            .unregisterActivityLifecycleCallbacks(
                                    this); // Use getApplicationContext() to avoid casting failures
                }
            }
        };

        if (this.registrar != null && this.registrar.context() != null && this.registrar.context().getApplicationContext() != null) {
            ((Application) this.registrar.context().getApplicationContext()).registerActivityLifecycleCallbacks(
                    this.activityLifecycleCallbacks);
        }
    }

    @Override
    public void onMethodCall(@NonNull MethodCall methodCall, @NonNull MethodChannel.Result result) {
        if ("getGallery".equals(methodCall.method)) {
            delegate.chooseImageFromGallery(methodCall, result);
        }
    }
}
