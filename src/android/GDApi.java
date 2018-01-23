package gd.plugin.cordova.api;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import android.app.Activity;
import com.gd.analytics.GDlogger;
import com.gd.analytics.GDadListener;
import com.gd.analytics.GDEvent;

/**
 * This class echoes a string called from JavaScript.
 */
public class GDApi extends CordovaPlugin {

   boolean isApiInitialized = false;
   CallbackContext callbackContextEvent;

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

        if (action.equals("init")) {
            String gameId = args.getString(0);
            String regId = args.getString(1);

            this.init(gameId,regId, callbackContext);
            return true;
        }

        if(action.equals("showBanner")){
            this.showBanner(callbackContext);
            return true;
        }

        if(action.equals("enableTestAds")){
            this.enableTestAds(callbackContext);
            return true;
        }

        if(action.equals("setAdListener")){
            this.callbackContextEvent = callbackContext;
            this.setAdListener(callbackContext);
            return true;
        }

        return false;
    }

    // this method initializes GDApi
    private void init(String gameId,String regId, CallbackContext callbackContext) {
       if(!isApiInitialized){
         Activity activity = this.cordova.getActivity();

         GDlogger.debug(true);
         GDlogger.init(gameId, regId, activity, true);
         isApiInitialized = true;
         callbackContext.success("Api initialized succesfully.");

       }
       else{
         callbackContext.error("Api is already initialized!");
       }

    }

    //this method request for an interstitial ad
    private void showBanner(CallbackContext callbackContext){

        if(isApiInitialized){
            GDlogger.ShowBanner(true);
        }
        else{
            callbackContext.error("Api is not initialized. Firstly, call init()");
        }
    }

    private void enableTestAds(CallbackContext callbackContext){
        GDlogger.enableTestAds();
    }

    // this method adds event listener for api. Invokes callbackContext.success when an event received
    private void setAdListener(final CallbackContext callbackContext) {
      if(isApiInitialized){
            GDlogger.setAdListener(new GDadListener() {
                @Override
                public void onBannerClosed() {
                    super.onBannerClosed();

                    PluginResult result;
                    try{
                        JSONObject jo = new JSONObject();
                        jo.put("event", "BANNER_CLOSED");

                        result = new PluginResult(PluginResult.Status.OK, jo);
                        result.setKeepCallback(true);
                        callbackContextEvent.sendPluginResult(result);
                        //callbackContext.success(jo);
                    }catch(JSONException je){
                        result = new PluginResult(PluginResult.Status.OK, je.getMessage());
                        result.setKeepCallback(true);
                        callbackContextEvent.sendPluginResult(result);
                    }

                }

                @Override
                public void onBannerStarted() {
                    super.onBannerStarted();

                    PluginResult result;
                    try{
                        JSONObject jo = new JSONObject();
                        jo.put("event", "BANNER_STARTED");

                        result = new PluginResult(PluginResult.Status.OK, jo);
                        result.setKeepCallback(true);
                        callbackContextEvent.sendPluginResult(result);

                        //callbackContext.success(jo);
                    }catch(JSONException je){
                        result = new PluginResult(PluginResult.Status.OK, je.getMessage());
                        result.setKeepCallback(true);
                        callbackContextEvent.sendPluginResult(result);
                    }

                }

                @Override
                public void onBannerRecieved(GDEvent data) {
                    super.onBannerRecieved(data);

                    PluginResult result;
                    try{
                        JSONObject jo = new JSONObject();
                        jo.put("event", "BANNER_RECEIVED");
                        jo.put("addType","interstitial");

                        result = new PluginResult(PluginResult.Status.OK, jo);
                        result.setKeepCallback(true);
                        callbackContextEvent.sendPluginResult(result);

                    }catch(JSONException je){
                        result = new PluginResult(PluginResult.Status.OK, je.getMessage());
                        result.setKeepCallback(true);
                        callbackContextEvent.sendPluginResult(result);
                    }
                }

                @Override
                public void onBannerFailed(String msg){
                    super.onBannerFailed(msg);

                    PluginResult result;
                    try{
                        JSONObject jo = new JSONObject();
                        jo.put("event", "BANNER_FAILED");
                        jo.put("message",msg);

                        result = new PluginResult(PluginResult.Status.OK, jo);
                        result.setKeepCallback(true);
                        callbackContextEvent.sendPluginResult(result);

                    }catch(JSONException je){
                        result = new PluginResult(PluginResult.Status.OK, je.getMessage());
                        result.setKeepCallback(true);
                        callbackContextEvent.sendPluginResult(result);
                    }

                }

                @Override
                public void onAPIReady(){
                    super.onAPIReady();

                    PluginResult result;
                    try{
                        JSONObject jo = new JSONObject();
                        jo.put("event", "API_IS_READY");

                        result = new PluginResult(PluginResult.Status.OK, jo);
                        result.setKeepCallback(true);
                        callbackContextEvent.sendPluginResult(result);

                    }catch(JSONException je){
                        result = new PluginResult(PluginResult.Status.OK, je.getMessage());
                        result.setKeepCallback(true);
                        callbackContextEvent.sendPluginResult(result);
                    }
                }


                @Override
                public void onAPINotReady(String error){
                    super.onAPIReady();

                    PluginResult result;
                    try{
                        JSONObject jo = new JSONObject();
                        jo.put("event", "API_NOT_READY");
                        jo.put("message",error);

                        result = new PluginResult(PluginResult.Status.OK, jo);
                        result.setKeepCallback(true);
                        callbackContextEvent.sendPluginResult(result);

                    }catch(JSONException je){
                        result = new PluginResult(PluginResult.Status.OK, je.getMessage());
                        result.setKeepCallback(true);
                        callbackContextEvent.sendPluginResult(result);
                    }
                }

            });
      }
      else{
          callbackContext.error("Api is not initialized. Firstly, call init()");
      }

    }
}
