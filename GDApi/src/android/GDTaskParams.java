package gd.plugin.cordova.api;

import org.apache.http.NameValuePair;

import java.util.List;

class GDTaskParams {
	protected String url = "";
	protected METHODS method;
	protected List<NameValuePair> params = null;

	protected enum METHODS {
		GET, POST
	}

}
