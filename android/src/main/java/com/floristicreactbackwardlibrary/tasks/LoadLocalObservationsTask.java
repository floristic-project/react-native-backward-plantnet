package com.floristicreactbackwardlibrary.tasks;

import android.content.Context;
import android.os.AsyncTask;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.floristicreactbackwardlibrary.RNBackwardPlantnetModule;

import java.io.FileInputStream;
import java.lang.ref.WeakReference;

public class LoadLocalObservationsTask extends AsyncTask<Integer, Integer, String> {
    private final static String OBSERVATIONS_JSON_FILE_NAME = "observations_json.txt";

    private WeakReference<Context> context;

    private Callback errorCallback;
    private Callback successCallback;
    private Promise promise;

    private Exception exception;

    public LoadLocalObservationsTask(Context context, Callback errorCallback, Callback successCallback, Promise promise) {
        this.context = new WeakReference<>(context);

        this.errorCallback = errorCallback;
        this.successCallback = successCallback;
        this.promise = promise;
    }

    @Override
    protected String doInBackground(Integer... integers) {
        String json = null;
        this.exception = null;

        if (this.context != null && this.context.get() != null) {
            try {
                FileInputStream fileInputStream = this.context.get().openFileInput(
                        LoadLocalObservationsTask.OBSERVATIONS_JSON_FILE_NAME
                );

                int size = fileInputStream.available();
                byte[] buffer = new byte[size];
                fileInputStream.read(buffer);
                fileInputStream.close();

                json = new String(buffer, "UTF-8");
            } catch (Exception e) {
                this.exception = e;
            }
        }

        return json;
    }

    @Override
    protected void onPostExecute(String result) {
        if (result != null) {
            if (this.promise != null) {
                this.promise.resolve(result);
            }

            if (this.successCallback != null) {
                this.successCallback.invoke(result);
            }
        } else {
            if (this.promise != null) {
                this.promise.reject(RNBackwardPlantnetModule.E_BACKWARD_PLANTNET_MODULE, this.exception);
            }

            if (this.errorCallback != null) {
                this.errorCallback.invoke(
                        RNBackwardPlantnetModule.E_BACKWARD_PLANTNET_MODULE
                        + ((this.exception != null) ? " " + this.exception.getMessage() : "")
                );
            }
        }
    }
}
