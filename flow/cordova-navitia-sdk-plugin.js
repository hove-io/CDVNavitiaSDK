declare module 'cordova-navitia-sdk-plugin' {
    declare export default {
        configuration: NavitiaConfiguration,
        endpoints: NavitiaEndpoints,
        features: NavitiaFeatures,
        init(token: string): void
    };
}

declare type NavitiaConfiguration = {
    token: string,
    baseUrl: string,
}

declare type NavitiaEndpoints = {
    places: EndpointPlaces,
}

declare type NavitiaFeatures = {
    autoComplete: EndpointPlaces,
}

declare type EndpointPlaces = {
    newRequestBuilder(): EndpointRequestBuilderPlaces,
}

declare class BaseNavitiaRequestBuilder {
    get(): Promise<EndpointResponsePlaces>
}

declare class EndpointRequestBuilderPlaces extends BaseNavitiaRequestBuilder {
    withQ(q: string): EndpointRequestBuilderPlaces,
    withCount(count: number): EndpointRequestBuilderPlaces,
}

declare type EndpointResponsePlaces = {
    links: Array<any>,
    places: Array<Places>,
    warnings: {
        id: string,
        message: string,
    }
}

declare type Places = {
    administrative_region: any,
    embedded_type: string,
    id: string,
    name: string,
    quality: number,
}
