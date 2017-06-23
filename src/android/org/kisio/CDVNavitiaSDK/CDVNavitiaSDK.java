package org.kisio.CDVNavitiaSDK;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;

import org.kisio.NavitiaSDK.BaseNavitiaRequestBuilder;
import org.kisio.NavitiaSDK.NavitiaConfiguration;
import org.kisio.NavitiaSDK.NavitiaSDK;
import org.kisio.NavitiaSDK.Places.EndpointPlaces;
import org.kisio.NavitiaSDK.Places.EndpointRequestBuilderPlaces;
import org.kisio.NavitiaSDK.ResourceRequestError;

public class CDVNavitiaSDK extends CordovaPlugin {

    private NavitiaSDK navitiaSdk;

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("init")) {
            String token = args.getString(0);
            this.init(token, callbackContext);
            return true;
        } else if (action.equals("endpoint_places")) {
            JSONObject params = args.getJSONObject(0);
            this.endpoint_places(params, callbackContext);
            return true;
        }
        return false;
    }

    private void init(String token, CallbackContext callbackContext) {
        if (token != null && token.length() > 0) {
            NavitiaConfiguration conf = new NavitiaConfiguration(token);
            this.navitiaSdk = new NavitiaSDK(conf);
            System.out.println("SDK created with token " + token);
            callbackContext.success();
        } else {
            callbackContext.error("No token provided");
        }
    }

    private void endpoint_places(final JSONObject params, final CallbackContext callbackContext) {
        final NavitiaSDK sdk = this.navitiaSdk;

        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                EndpointPlaces places = sdk.getEndpoints().getPlaces();
                final EndpointRequestBuilderPlaces queryBuilder = places.newRequestBuilder();

                addParameter(queryBuilder, params, "q");
                addParameter(queryBuilder, params, "count");

                try {
                    queryBuilder.rawGet(new BaseNavitiaRequestBuilder.BaseRequestCallback() {
                        @Override
                        public void callback(org.json.simple.JSONObject jsonObject) {
                            try {
                                System.out.println(String.format("SDK places with query %s", queryBuilder.getUrl()));
                                String jsonString = jsonObject.toJSONString();
                                JSONObject result = new JSONObject(jsonString);
                                callbackContext.success(result);
                            } catch (JSONException e) {
                                System.out.println("An exception has occurred");
                                String errorMessage = String.valueOf(e.hashCode()) + ": " + e.getMessage();
                                callbackContext.error(errorMessage);
                            }
                        }
                    }, new BaseNavitiaRequestBuilder.ErrorRequestCallback() {
                        @Override
                        public void callback(ResourceRequestError resourceRequestError) {
                            System.out.println("SDK places fail");
                            String errorMessage = resourceRequestError.getHttpStatusCode() + ": " + resourceRequestError.getMessage();
                            callbackContext.error(errorMessage);
                        }
                    });
                } catch (Exception e) {
                    System.out.println("An exception has occurred");
                    String errorMessage = String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }

    private void addParameter(BaseNavitiaRequestBuilder queryBuilder, JSONObject params, String name) {
        try {
            queryBuilder.addQueryParameter(name, String.valueOf(params.get(name)));
        } catch (JSONException e) {
            // Case: Parameter not provided
        }
    }
}