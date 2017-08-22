package gd.plugin.cordova.api;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import android.app.Activity;
import com.gd.analytics.GDlogger;

/**
 * This class echoes a string called from JavaScript.
 */
public class GDApi extends CordovaPlugin {

   boolean isApiInitialized = false;

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

        return false;
    }

    // this method initializes GDApi
    private void init(String gameId,String regId, CallbackContext callbackContext) {

       //Gd init will be implemented here
       // if succeeds
       Activity activity = this.cordova.getActivity();
       GDlogger.debug(true);
       GDlogger.init(gameId, regId, activity, true);
       isApiInitialized = true;
       callbackContext.success("Api initialized succesfully.");

       /* if error occurs
       callbackContext.error("Api initializing failed."); */
    }

    private void showBanner(CallbackContext callbackContext){

        if(isApiInitialized){
            GDlogger.ShowBanner(true);
        }
        else{
            callbackContext.error("Api is not initialized. Firstly, call init()");
        }
    }
}
