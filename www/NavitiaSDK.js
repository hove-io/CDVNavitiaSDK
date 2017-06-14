import { exec } from 'cordova/exec';

export default {
    init: (token, success, error) => {
        exec(success, error, 'NavitiaSDK', 'init', [token]);
    },
    endpoints: {
        places: { newRequestBuilder: () => new EndpointRequestBuilderPlaces() }
    },
    features: {
        autoComplete: { newRequestBuilder: () => new EndpointRequestBuilderPlaces() }
    }
};
