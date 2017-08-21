package gd.plugin.cordova.api;

import org.apache.http.Header;

abstract class GDHttpAyncResponseHandler {

	protected abstract void onFailure(int statusCode, Header[] header, String content, Throwable error);

	protected abstract void onSuccess(int statusCode, Header[] header, String content);

}
