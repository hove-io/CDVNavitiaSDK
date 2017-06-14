import { exec } from 'cordova/exec';

class BaseNavitiaRequestBuilder {
    constructor() {
        this.props = {};
    }
}

export default class EndpointRequestBuilderPlaces extends BaseNavitiaRequestBuilder {
    withQ(q) {
        this.props.q = q;
        return this;
    }

    withCount(count) {
        this.props.count = count;
        return this;
    }

    get() {
        exec((places) => {
            return places;
        }), (error) => {
            //LogInfo error
        }, 'NavitiaSDK', 'endpoint_places', [this.props]);
    }
}