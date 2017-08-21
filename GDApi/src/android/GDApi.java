package gd.plugin.cordova.api;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * This class echoes a string called from JavaScript.
 */
public class GDApi extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

        if (action.equals("init")) {
            String gameId = args.getString(0);
            String regId = args.getString(1);

            this.init(gameId,regId, callbackContext);
            return true;
        }
        return false;
    }

    // this method initializes GDApi
    private void init(String gameId,String regId, CallbackContext callbackContext) {

       //Gd init will be implemented here
       // if succeeds
       callbackContext.success("Api initialized succesfully.");

       /* if error occurs
       callbackContext.error("Api initializing failed."); */
    }
}
