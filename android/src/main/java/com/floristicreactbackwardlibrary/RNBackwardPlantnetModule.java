
package com.floristicreactbackwardlibrary;

import android.support.annotation.Nullable;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.floristicreactbackwardlibrary.tasks.LoadLocalObservationsTask;

import java.util.HashMap;
import java.util.Map;

/*
 * A native module is a Java class that usually extends the ReactContextBaseJavaModule class and
 * implements the functionality required by the JavaScript.
 *
 * To make it simpler to access your new functionality from JavaScript, it is common to wrap the
 * native module in a JavaScript module. This is not necessary but saves the consumers of your
 * library the need to pull it off of NativeModules each time. This JavaScript file also becomes
 * a good location for you to add any JavaScript side functionality.
 */
public class RNBackwardPlantnetModule extends ReactContextBaseJavaModule {

    public static final String E_BACKWARD_PLANTNET_MODULE = "ERROR_BACKWARD_PLANTNET_MODULE";

    /*
     * The following argument types are supported for methods annotated with @ReactMethod and they
     * directly map to their JavaScript equivalents.
     *
     * Boolean -> Bool
     * Integer -> Number
     * Double -> Number
     * Float -> Number
     * String -> String
     * Callback -> function
     * ReadableMap -> Object
     * ReadableArray -> Array
     */

    private final ReactApplicationContext reactContext;

    public RNBackwardPlantnetModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    /*
     * The purpose of this method is to return the string name of the NativeModule which represents
     * this class in JavaScript. So here we will call this ToastExample so that we can access it
     * through React.NativeModules.ToastExample in JavaScript.
     */

    @Override
    public String getName() {
        return "RNBackwardPlantnet";
    }

    /*
     * An optional method called getConstants returns the constant values exposed to JavaScript.
     * Its implementation is not required but is very useful to key pre-defined values that need to
     * be communicated from JavaScript to Java in sync.
     */
    @Override
    public Map<String, Object> getConstants() {
        return new HashMap<>();
    }

    /*
     * To expose a method to JavaScript a Java method must be annotated using @ReactMethod.
     * The return type of bridge methods is always void. React Native bridge is asynchronous,
     * so the only way to pass a result to JavaScript is by using callbacks or emitting events.
     *
     * Native modules also support a special kind of argument - a callback.
     * In most cases it is used to provide the function call result to JavaScript.
     *
     * Native modules can also fulfill a promise, which can simplify your code, especially when
     * using ES2016's async/await syntax. When the last parameter of a bridged native method is a
     * Promise, its corresponding JS method will return a JS Promise object.
     */

    @ReactMethod
    public void loadExistingObservationsCallback(Callback errorCallback, Callback successCallback) {
        //errorCallback.invoke(RNReadWriteExifModule.E_READ_SRC_FILE_ERROR + " " + e.getMessage());
        //errorCallback.invoke(RNReadWriteExifModule.E_READ_DEST_FILE_ERROR + " " + e.getMessage());
        this.loadExistingObservations(errorCallback, successCallback, null);
    }

    @ReactMethod
    public void loadExistingObservationsPromise(Promise promise) {
        //promise.reject(RNReadWriteExifModule.E_READ_SRC_FILE_ERROR, e);
        //promise.reject(RNReadWriteExifModule.E_READ_DEST_FILE_ERROR, e);
        this.loadExistingObservations(null, null, promise);
    }

    private void loadExistingObservations(
            @Nullable Callback errorCallback, @Nullable Callback successCallback,
            @Nullable Promise promise) {
        LoadLocalObservationsTask task = new LoadLocalObservationsTask(
                this.reactContext, errorCallback, successCallback, promise
        );
        task.execute();
    }
}