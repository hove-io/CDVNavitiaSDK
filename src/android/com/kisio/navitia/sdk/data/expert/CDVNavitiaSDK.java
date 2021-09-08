package com.kisio.navitia.sdk.data.expert;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.jetbrains.annotations.NotNull;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;

import org.joda.time.DateTime;

import com.kisio.navitia.sdk.data.expert.ExpertSdk;
import com.kisio.navitia.sdk.data.expert.NavitiaEnvironment;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;

import okhttp3.Call;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.math.BigDecimal;

import retrofit2.Response;

public class CDVNavitiaSDK extends CordovaPlugin {

    private ExpertSdk expertSdk;
    private Map<String, Action> actions = new HashMap<String, Action>();

    private interface IAction {

        void doAction(JSONObject params, CallbackContext callbackContext);
    }

    private abstract class Action implements IAction {

        @Override
        public abstract void doAction(JSONObject params, CallbackContext callbackContext);
    }

    private List<String> jsonArrayToStringList(JSONArray array) {
        List<String> result = new ArrayList<String>();
        try {
            for (int i = 0; i < array.length(); i++) {
                result.add(array.getString(i));
            }
        } catch (JSONException e) {
        }
        return result;
    }

    private List<Integer> jsonArrayToIntegerList(JSONArray array) {
        List<Integer> result = new ArrayList<Integer>();
        try {
            for (int i = 0; i < array.length(); i++) {
                result.add(array.getInt(i));
            }
        } catch (JSONException e) {
        }
        return result;
    }

    private Boolean booleanStraightPass(Boolean value) {
        return value;
    }

    private Integer integerStraightPass(Integer value) {
        return value;
    }

    private BigDecimal longToBigDecimal(long value) {
        return new BigDecimal(value);
    }

    private Float longToFloat(long value) {
        return longToBigDecimal(value).floatValue();
    }

    private String stringStraightPass(String value) {
        return value;
    }

    private DateTime stringToDateTime(String value) {
        return new DateTime(value);
    }

    public CDVNavitiaSDK() {
        actions.put("coverageLonLatAddresses", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatAddresses(params, callbackContext);
            }
        });
        actions.put("coverageLonLatAddressesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatAddressesId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriAddresses", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriAddresses(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriAddressesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriAddressesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionAddresses", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionAddresses(params, callbackContext);
            }
        });
        actions.put("coverageRegionAddressesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionAddressesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriAddresses", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriAddresses(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriAddressesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriAddressesId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatCalendars", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatCalendars(params, callbackContext);
            }
        });
        actions.put("coverageLonLatCalendarsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatCalendarsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriCalendars", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriCalendars(params, callbackContext);
            }
        });
        actions.put("coverageRegionCalendars", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionCalendars(params, callbackContext);
            }
        });
        actions.put("coverageRegionCalendarsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionCalendarsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriCalendars", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriCalendars(params, callbackContext);
            }
        });
        actions.put("coverageLonLatCommercialModes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatCommercialModes(params, callbackContext);
            }
        });
        actions.put("coverageLonLatCommercialModesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatCommercialModesId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriCommercialModes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriCommercialModes(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriCommercialModesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriCommercialModesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionCommercialModes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionCommercialModes(params, callbackContext);
            }
        });
        actions.put("coverageRegionCommercialModesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionCommercialModesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriCommercialModes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriCommercialModes(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriCommercialModesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriCommercialModesId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatCompanies", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatCompanies(params, callbackContext);
            }
        });
        actions.put("coverageLonLatCompaniesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatCompaniesId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriCompanies", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriCompanies(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriCompaniesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriCompaniesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionCompanies", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionCompanies(params, callbackContext);
            }
        });
        actions.put("coverageRegionCompaniesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionCompaniesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriCompanies", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriCompanies(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriCompaniesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriCompaniesId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatContributors", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatContributors(params, callbackContext);
            }
        });
        actions.put("coverageLonLatContributorsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatContributorsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriContributors", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriContributors(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriContributorsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriContributorsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionContributors", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionContributors(params, callbackContext);
            }
        });
        actions.put("coverageRegionContributorsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionContributorsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriContributors", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriContributors(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriContributorsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriContributorsId(params, callbackContext);
            }
        });
        actions.put("coordLonLat", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coordLonLat(params, callbackContext);
            }
        });
        actions.put("coordsLonLat", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coordsLonLat(params, callbackContext);
            }
        });
        actions.put("coverageRegionCoordLonLatAddresses", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionCoordLonLatAddresses(params, callbackContext);
            }
        });
        actions.put("coverageRegionCoordsLonLatAddresses", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionCoordsLonLatAddresses(params, callbackContext);
            }
        });
        actions.put("coverageLonLatCoord", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatCoord(params, callbackContext);
            }
        });
        actions.put("coverageLonLatCoordId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatCoordId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatCoords", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatCoords(params, callbackContext);
            }
        });
        actions.put("coverageLonLatCoordsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatCoordsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriCoord", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriCoord(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriCoordId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriCoordId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriCoords", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriCoords(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriCoordsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriCoordsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionCoord", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionCoord(params, callbackContext);
            }
        });
        actions.put("coverageRegionCoordId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionCoordId(params, callbackContext);
            }
        });
        actions.put("coverageRegionCoords", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionCoords(params, callbackContext);
            }
        });
        actions.put("coverageRegionCoordsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionCoordsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriCoord", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriCoord(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriCoordId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriCoordId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriCoords", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriCoords(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriCoordsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriCoordsId(params, callbackContext);
            }
        });
        actions.put("coverage", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverage(params, callbackContext);
            }
        });
        actions.put("coverageLonLat", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLat(params, callbackContext);
            }
        });
        actions.put("coverageRegion", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegion(params, callbackContext);
            }
        });
        actions.put("coverageLonLatDatasets", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatDatasets(params, callbackContext);
            }
        });
        actions.put("coverageLonLatDatasetsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatDatasetsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriDatasets", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriDatasets(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriDatasetsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriDatasetsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionDatasets", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionDatasets(params, callbackContext);
            }
        });
        actions.put("coverageRegionDatasetsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionDatasetsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriDatasets", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriDatasets(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriDatasetsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriDatasetsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatDisruptions", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatDisruptions(params, callbackContext);
            }
        });
        actions.put("coverageLonLatDisruptionsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatDisruptionsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriDisruptions", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriDisruptions(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriDisruptionsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriDisruptionsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionDisruptions", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionDisruptions(params, callbackContext);
            }
        });
        actions.put("coverageRegionDisruptionsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionDisruptionsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriDisruptions", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriDisruptions(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriDisruptionsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriDisruptionsId(params, callbackContext);
            }
        });
        actions.put("coordLonLatEquipmentReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coordLonLatEquipmentReports(params, callbackContext);
            }
        });
        actions.put("coordsLonLatEquipmentReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coordsLonLatEquipmentReports(params, callbackContext);
            }
        });
        actions.put("coverageLonLatEquipmentReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatEquipmentReports(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriEquipmentReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriEquipmentReports(params, callbackContext);
            }
        });
        actions.put("coverageRegionEquipmentReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionEquipmentReports(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriEquipmentReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriEquipmentReports(params, callbackContext);
            }
        });
        actions.put("coverageLonLatGeoStatus", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatGeoStatus(params, callbackContext);
            }
        });
        actions.put("coverageRegionGeoStatus", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionGeoStatus(params, callbackContext);
            }
        });
        actions.put("coverageLonLatIsochrones", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatIsochrones(params, callbackContext);
            }
        });
        actions.put("coverageRegionIsochrones", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionIsochrones(params, callbackContext);
            }
        });
        actions.put("coverageLonLatHeatMaps", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatHeatMaps(params, callbackContext);
            }
        });
        actions.put("coverageRegionHeatMaps", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionHeatMaps(params, callbackContext);
            }
        });
        actions.put("coverageLonLatJourneyPatternPoints", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatJourneyPatternPoints(params, callbackContext);
            }
        });
        actions.put("coverageLonLatJourneyPatternPointsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatJourneyPatternPointsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriJourneyPatternPoints", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriJourneyPatternPoints(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriJourneyPatternPointsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriJourneyPatternPointsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionJourneyPatternPoints", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionJourneyPatternPoints(params, callbackContext);
            }
        });
        actions.put("coverageRegionJourneyPatternPointsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionJourneyPatternPointsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriJourneyPatternPoints", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriJourneyPatternPoints(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriJourneyPatternPointsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriJourneyPatternPointsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatJourneyPatterns", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatJourneyPatterns(params, callbackContext);
            }
        });
        actions.put("coverageLonLatJourneyPatternsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatJourneyPatternsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriJourneyPatterns", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriJourneyPatterns(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriJourneyPatternsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriJourneyPatternsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionJourneyPatterns", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionJourneyPatterns(params, callbackContext);
            }
        });
        actions.put("coverageRegionJourneyPatternsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionJourneyPatternsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriJourneyPatterns", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriJourneyPatterns(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriJourneyPatternsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriJourneyPatternsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatJourneys", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatJourneys(params, callbackContext);
            }
        });
        actions.put("coverageRegionJourneys", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionJourneys(params, callbackContext);
            }
        });
        actions.put("journeys", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                journeys(params, callbackContext);
            }
        });
        actions.put("coverageLonLatLineGroups", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatLineGroups(params, callbackContext);
            }
        });
        actions.put("coverageLonLatLineGroupsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatLineGroupsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriLineGroups", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriLineGroups(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriLineGroupsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriLineGroupsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionLineGroups", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionLineGroups(params, callbackContext);
            }
        });
        actions.put("coverageRegionLineGroupsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionLineGroupsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriLineGroups", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriLineGroups(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriLineGroupsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriLineGroupsId(params, callbackContext);
            }
        });
        actions.put("lineGroups", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                lineGroups(params, callbackContext);
            }
        });
        actions.put("coverageLonLatLineReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatLineReports(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriLineReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriLineReports(params, callbackContext);
            }
        });
        actions.put("coverageRegionLineReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionLineReports(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriLineReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriLineReports(params, callbackContext);
            }
        });
        actions.put("coverageLonLatLines", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatLines(params, callbackContext);
            }
        });
        actions.put("coverageLonLatLinesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatLinesId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriLines", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriLines(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriLinesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriLinesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionLines", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionLines(params, callbackContext);
            }
        });
        actions.put("coverageRegionLinesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionLinesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriLines", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriLines(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriLinesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriLinesId(params, callbackContext);
            }
        });
        actions.put("lines", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                lines(params, callbackContext);
            }
        });
        actions.put("coverageLonLatNetworks", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatNetworks(params, callbackContext);
            }
        });
        actions.put("coverageLonLatNetworksId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatNetworksId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriNetworks", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriNetworks(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriNetworksId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriNetworksId(params, callbackContext);
            }
        });
        actions.put("coverageRegionNetworks", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionNetworks(params, callbackContext);
            }
        });
        actions.put("coverageRegionNetworksId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionNetworksId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriNetworks", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriNetworks(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriNetworksId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriNetworksId(params, callbackContext);
            }
        });
        actions.put("networks", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                networks(params, callbackContext);
            }
        });
        actions.put("coverageLonLatArrivals", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatArrivals(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriArrivals", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriArrivals(params, callbackContext);
            }
        });
        actions.put("coverageRegionArrivals", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionArrivals(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriArrivals", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriArrivals(params, callbackContext);
            }
        });
        actions.put("coverageLonLatDepartures", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatDepartures(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriDepartures", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriDepartures(params, callbackContext);
            }
        });
        actions.put("coverageRegionDepartures", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionDepartures(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriDepartures", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriDepartures(params, callbackContext);
            }
        });
        actions.put("coverageLonLatPhysicalModes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatPhysicalModes(params, callbackContext);
            }
        });
        actions.put("coverageLonLatPhysicalModesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatPhysicalModesId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriPhysicalModes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriPhysicalModes(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriPhysicalModesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriPhysicalModesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionPhysicalModes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionPhysicalModes(params, callbackContext);
            }
        });
        actions.put("coverageRegionPhysicalModesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionPhysicalModesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriPhysicalModes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriPhysicalModes(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriPhysicalModesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriPhysicalModesId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatPlacesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatPlacesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionPlacesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionPlacesId(params, callbackContext);
            }
        });
        actions.put("placesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                placesId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatPlaces", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatPlaces(params, callbackContext);
            }
        });
        actions.put("coverageRegionPlaces", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionPlaces(params, callbackContext);
            }
        });
        actions.put("places", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                places(params, callbackContext);
            }
        });
        actions.put("coordLonLatPlacesNearby", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coordLonLatPlacesNearby(params, callbackContext);
            }
        });
        actions.put("coordsLonLatPlacesNearby", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coordsLonLatPlacesNearby(params, callbackContext);
            }
        });
        actions.put("coverageLonLatPlacesNearby", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatPlacesNearby(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriPlacesNearby", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriPlacesNearby(params, callbackContext);
            }
        });
        actions.put("coverageRegionPlacesNearby", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionPlacesNearby(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriPlacesNearby", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriPlacesNearby(params, callbackContext);
            }
        });
        actions.put("coverageLonLatPoiTypes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatPoiTypes(params, callbackContext);
            }
        });
        actions.put("coverageLonLatPoiTypesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatPoiTypesId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriPoiTypes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriPoiTypes(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriPoiTypesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriPoiTypesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionPoiTypes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionPoiTypes(params, callbackContext);
            }
        });
        actions.put("coverageRegionPoiTypesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionPoiTypesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriPoiTypes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriPoiTypes(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriPoiTypesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriPoiTypesId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatPois", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatPois(params, callbackContext);
            }
        });
        actions.put("coverageLonLatPoisId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatPoisId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriPois", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriPois(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriPoisId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriPoisId(params, callbackContext);
            }
        });
        actions.put("coverageRegionPois", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionPois(params, callbackContext);
            }
        });
        actions.put("coverageRegionPoisId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionPoisId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriPois", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriPois(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriPoisId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriPoisId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatPtObjects", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatPtObjects(params, callbackContext);
            }
        });
        actions.put("coverageRegionPtObjects", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionPtObjects(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriRouteSchedules", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriRouteSchedules(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriRouteSchedules", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriRouteSchedules(params, callbackContext);
            }
        });
        actions.put("routeSchedules", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                routeSchedules(params, callbackContext);
            }
        });
        actions.put("coverageLonLatRoutes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatRoutes(params, callbackContext);
            }
        });
        actions.put("coverageLonLatRoutesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatRoutesId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriRoutes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriRoutes(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriRoutesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriRoutesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionRoutes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionRoutes(params, callbackContext);
            }
        });
        actions.put("coverageRegionRoutesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionRoutesId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriRoutes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriRoutes(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriRoutesId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriRoutesId(params, callbackContext);
            }
        });
        actions.put("routes", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                routes(params, callbackContext);
            }
        });
        actions.put("coverageLonLatStopAreas", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatStopAreas(params, callbackContext);
            }
        });
        actions.put("coverageLonLatStopAreasId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatStopAreasId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriStopAreas", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriStopAreas(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriStopAreasId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriStopAreasId(params, callbackContext);
            }
        });
        actions.put("coverageRegionStopAreas", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionStopAreas(params, callbackContext);
            }
        });
        actions.put("coverageRegionStopAreasId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionStopAreasId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriStopAreas", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriStopAreas(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriStopAreasId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriStopAreasId(params, callbackContext);
            }
        });
        actions.put("stopAreas", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                stopAreas(params, callbackContext);
            }
        });
        actions.put("coverageLonLatStopPoints", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatStopPoints(params, callbackContext);
            }
        });
        actions.put("coverageLonLatStopPointsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatStopPointsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriStopPoints", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriStopPoints(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriStopPointsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriStopPointsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionStopPoints", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionStopPoints(params, callbackContext);
            }
        });
        actions.put("coverageRegionStopPointsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionStopPointsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriStopPoints", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriStopPoints(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriStopPointsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriStopPointsId(params, callbackContext);
            }
        });
        actions.put("stopPoints", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                stopPoints(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriStopSchedules", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriStopSchedules(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriStopSchedules", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriStopSchedules(params, callbackContext);
            }
        });
        actions.put("stopSchedules", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                stopSchedules(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriTerminusSchedules", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriTerminusSchedules(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriTerminusSchedules", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriTerminusSchedules(params, callbackContext);
            }
        });
        actions.put("terminusSchedules", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                terminusSchedules(params, callbackContext);
            }
        });
        actions.put("coverageLonLatTrafficReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatTrafficReports(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriTrafficReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriTrafficReports(params, callbackContext);
            }
        });
        actions.put("coverageRegionTrafficReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionTrafficReports(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriTrafficReports", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriTrafficReports(params, callbackContext);
            }
        });
        actions.put("coverageLonLatTrips", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatTrips(params, callbackContext);
            }
        });
        actions.put("coverageLonLatTripsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatTripsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriTrips", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriTrips(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriTripsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriTripsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionTrips", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionTrips(params, callbackContext);
            }
        });
        actions.put("coverageRegionTripsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionTripsId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriTrips", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriTrips(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriTripsId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriTripsId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriVehicleJourneys", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriVehicleJourneys(params, callbackContext);
            }
        });
        actions.put("coverageLonLatUriVehicleJourneysId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatUriVehicleJourneysId(params, callbackContext);
            }
        });
        actions.put("coverageLonLatVehicleJourneys", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatVehicleJourneys(params, callbackContext);
            }
        });
        actions.put("coverageLonLatVehicleJourneysId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageLonLatVehicleJourneysId(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriVehicleJourneys", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriVehicleJourneys(params, callbackContext);
            }
        });
        actions.put("coverageRegionUriVehicleJourneysId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionUriVehicleJourneysId(params, callbackContext);
            }
        });
        actions.put("coverageRegionVehicleJourneys", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionVehicleJourneys(params, callbackContext);
            }
        });
        actions.put("coverageRegionVehicleJourneysId", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                coverageRegionVehicleJourneysId(params, callbackContext);
            }
        });
        actions.put("vehicleJourneys", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                vehicleJourneys(params, callbackContext);
            }
        });
        actions.put("init", new Action() {
            @Override
            public void doAction(JSONObject params, CallbackContext callbackContext) {
                init(params, callbackContext);
            }
        });
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (actions.containsKey(action)) {
            actions.get(action).doAction(args.getJSONObject(0), callbackContext);
        } else {
            callbackContext.error("Action " + action + " not found");
        }

        return true;
    }

    private void init(JSONObject config, CallbackContext callbackContext) {
        String token = config.optString("token");
        if (token.isEmpty()) {
            callbackContext.error("No token specified");
            return;
        }

        try {
            ExpertSdk.Companion.getInstance().init(token, NavitiaEnvironment.PROD);
            callbackContext.success("SDK created with token " + token);
        } catch (Exception e) {
            callbackContext.error(e.getMessage());
        }
    }

    final private void coverageLonLatAddresses(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.addressesApi.getCoverageLonLatAddresses(lat, lon,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatAddressesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.addressesApi.getCoverageLonLatAddressesId(lat, lon, id,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriAddresses(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.addressesApi.getCoverageLonLatUriAddresses(lat, lon, uri,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriAddressesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.addressesApi.getCoverageLonLatUriAddressesId(lat, lon, uri, id,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionAddresses(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.addressesApi.getCoverageRegionAddresses(region,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionAddressesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.addressesApi.getCoverageRegionAddressesId(region, id,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriAddresses(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.addressesApi.getCoverageRegionUriAddresses(region, uri,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriAddressesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.addressesApi.getCoverageRegionUriAddressesId(region, uri, id,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatCalendars(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.calendarsApi.getCoverageLonLatCalendars(lat, lon, depth,count,startPage,startDate,endDate,forbiddenId,forbiddenUris,distance, new Continuation<Response<Calendars>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Calendars> result = (Response<Calendars>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatCalendarsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.calendarsApi.getCoverageLonLatCalendarsId(lat, lon, id, depth,count,startPage,startDate,endDate,forbiddenId,forbiddenUris,distance, new Continuation<Response<Calendars>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Calendars> result = (Response<Calendars>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriCalendars(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.calendarsApi.getCoverageLonLatUriCalendars(lat, lon, uri, depth,count,startPage,startDate,endDate,forbiddenId,forbiddenUris,distance, new Continuation<Response<Calendars>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Calendars> result = (Response<Calendars>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionCalendars(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.calendarsApi.getCoverageRegionCalendars(region, depth,count,startPage,startDate,endDate,forbiddenId,forbiddenUris,distance, new Continuation<Response<Calendars>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Calendars> result = (Response<Calendars>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionCalendarsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.calendarsApi.getCoverageRegionCalendarsId(region, id, depth,count,startPage,startDate,endDate,forbiddenId,forbiddenUris,distance, new Continuation<Response<Calendars>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Calendars> result = (Response<Calendars>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriCalendars(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.calendarsApi.getCoverageRegionUriCalendars(region, uri, depth,count,startPage,startDate,endDate,forbiddenId,forbiddenUris,distance, new Continuation<Response<Calendars>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Calendars> result = (Response<Calendars>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatCommercialModes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.commercialModesApi.getCoverageLonLatCommercialModes(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<CommercialModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<CommercialModes> result = (Response<CommercialModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatCommercialModesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.commercialModesApi.getCoverageLonLatCommercialModesId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<CommercialModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<CommercialModes> result = (Response<CommercialModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriCommercialModes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.commercialModesApi.getCoverageLonLatUriCommercialModes(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<CommercialModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<CommercialModes> result = (Response<CommercialModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriCommercialModesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.commercialModesApi.getCoverageLonLatUriCommercialModesId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<CommercialModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<CommercialModes> result = (Response<CommercialModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionCommercialModes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.commercialModesApi.getCoverageRegionCommercialModes(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<CommercialModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<CommercialModes> result = (Response<CommercialModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionCommercialModesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.commercialModesApi.getCoverageRegionCommercialModesId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<CommercialModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<CommercialModes> result = (Response<CommercialModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriCommercialModes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.commercialModesApi.getCoverageRegionUriCommercialModes(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<CommercialModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<CommercialModes> result = (Response<CommercialModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriCommercialModesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.commercialModesApi.getCoverageRegionUriCommercialModesId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<CommercialModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<CommercialModes> result = (Response<CommercialModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatCompanies(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.companiesApi.getCoverageLonLatCompanies(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Companies>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Companies> result = (Response<Companies>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatCompaniesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.companiesApi.getCoverageLonLatCompaniesId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Companies>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Companies> result = (Response<Companies>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriCompanies(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.companiesApi.getCoverageLonLatUriCompanies(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Companies>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Companies> result = (Response<Companies>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriCompaniesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.companiesApi.getCoverageLonLatUriCompaniesId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Companies>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Companies> result = (Response<Companies>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionCompanies(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.companiesApi.getCoverageRegionCompanies(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Companies>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Companies> result = (Response<Companies>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionCompaniesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.companiesApi.getCoverageRegionCompaniesId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Companies>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Companies> result = (Response<Companies>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriCompanies(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.companiesApi.getCoverageRegionUriCompanies(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Companies>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Companies> result = (Response<Companies>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriCompaniesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.companiesApi.getCoverageRegionUriCompaniesId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Companies>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Companies> result = (Response<Companies>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatContributors(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.contributorsApi.getCoverageLonLatContributors(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Contributors>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Contributors> result = (Response<Contributors>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatContributorsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.contributorsApi.getCoverageLonLatContributorsId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Contributors>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Contributors> result = (Response<Contributors>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriContributors(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.contributorsApi.getCoverageLonLatUriContributors(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Contributors>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Contributors> result = (Response<Contributors>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriContributorsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.contributorsApi.getCoverageLonLatUriContributorsId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Contributors>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Contributors> result = (Response<Contributors>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionContributors(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.contributorsApi.getCoverageRegionContributors(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Contributors>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Contributors> result = (Response<Contributors>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionContributorsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.contributorsApi.getCoverageRegionContributorsId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Contributors>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Contributors> result = (Response<Contributors>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriContributors(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.contributorsApi.getCoverageRegionUriContributors(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Contributors>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Contributors> result = (Response<Contributors>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriContributorsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.contributorsApi.getCoverageRegionUriContributorsId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Contributors>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Contributors> result = (Response<Contributors>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coordLonLat(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordApi.getCoordLonLat(lat, lon,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coordsLonLat(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordApi.getCoordsLonLat(lat, lon,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionCoordLonLatAddresses(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordApi.getCoverageRegionCoordLonLatAddresses(lat, region, lon,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionCoordsLonLatAddresses(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordApi.getCoverageRegionCoordsLonLatAddresses(lat, region, lon,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatCoord(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageLonLatCoord(lat, lon,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatCoordId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageLonLatCoordId(lat, lon, id,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatCoords(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageLonLatCoords(lat, lon,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatCoordsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageLonLatCoordsId(lat, lon, id,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriCoord(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageLonLatUriCoord(lat, lon, uri,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriCoordId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageLonLatUriCoordId(lat, lon, uri, id,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriCoords(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageLonLatUriCoords(lat, lon, uri,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriCoordsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageLonLatUriCoordsId(lat, lon, uri, id,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionCoord(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageRegionCoord(region,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionCoordId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageRegionCoordId(region, id,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionCoords(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageRegionCoords(region,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionCoordsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageRegionCoordsId(region, id,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriCoord(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageRegionUriCoord(region, uri,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriCoordId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageRegionUriCoordId(region, uri, id,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriCoords(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageRegionUriCoords(region, uri,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriCoordsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coordsApi.getCoverageRegionUriCoordsId(region, uri, id,  new Continuation<Response<DictAddresses>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<DictAddresses> result = (Response<DictAddresses>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverage(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coverageApi.getCoverage(disableGeojson, new Continuation<Response<Coverages>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Coverages> result = (Response<Coverages>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLat(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coverageApi.getCoverageLonLat(lat, lon, disableGeojson, new Continuation<Response<Coverages>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Coverages> result = (Response<Coverages>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegion(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.coverageApi.getCoverageRegion(region, disableGeojson, new Continuation<Response<Coverages>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Coverages> result = (Response<Coverages>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatDatasets(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.datasetsApi.getCoverageLonLatDatasets(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Datasets>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Datasets> result = (Response<Datasets>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatDatasetsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.datasetsApi.getCoverageLonLatDatasetsId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Datasets>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Datasets> result = (Response<Datasets>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriDatasets(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.datasetsApi.getCoverageLonLatUriDatasets(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Datasets>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Datasets> result = (Response<Datasets>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriDatasetsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.datasetsApi.getCoverageLonLatUriDatasetsId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Datasets>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Datasets> result = (Response<Datasets>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionDatasets(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.datasetsApi.getCoverageRegionDatasets(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Datasets>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Datasets> result = (Response<Datasets>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionDatasetsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.datasetsApi.getCoverageRegionDatasetsId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Datasets>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Datasets> result = (Response<Datasets>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriDatasets(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.datasetsApi.getCoverageRegionUriDatasets(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Datasets>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Datasets> result = (Response<Datasets>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriDatasetsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.datasetsApi.getCoverageRegionUriDatasetsId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Datasets>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Datasets> result = (Response<Datasets>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatDisruptions(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.disruptionsApi.getCoverageLonLatDisruptions(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Disruptions>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Disruptions> result = (Response<Disruptions>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatDisruptionsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.disruptionsApi.getCoverageLonLatDisruptionsId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Disruptions>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Disruptions> result = (Response<Disruptions>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriDisruptions(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.disruptionsApi.getCoverageLonLatUriDisruptions(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Disruptions>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Disruptions> result = (Response<Disruptions>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriDisruptionsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.disruptionsApi.getCoverageLonLatUriDisruptionsId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Disruptions>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Disruptions> result = (Response<Disruptions>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionDisruptions(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.disruptionsApi.getCoverageRegionDisruptions(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Disruptions>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Disruptions> result = (Response<Disruptions>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionDisruptionsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.disruptionsApi.getCoverageRegionDisruptionsId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Disruptions>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Disruptions> result = (Response<Disruptions>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriDisruptions(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.disruptionsApi.getCoverageRegionUriDisruptions(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Disruptions>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Disruptions> result = (Response<Disruptions>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriDisruptionsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.disruptionsApi.getCoverageRegionUriDisruptionsId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Disruptions>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Disruptions> result = (Response<Disruptions>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coordLonLatEquipmentReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.equipmentReportsApi.getCoordLonLatEquipmentReports(lat, lon, depth,count,filter,startPage,forbiddenUris, new Continuation<Response<EquipmentReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<EquipmentReports> result = (Response<EquipmentReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coordsLonLatEquipmentReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.equipmentReportsApi.getCoordsLonLatEquipmentReports(lat, lon, depth,count,filter,startPage,forbiddenUris, new Continuation<Response<EquipmentReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<EquipmentReports> result = (Response<EquipmentReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatEquipmentReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.equipmentReportsApi.getCoverageLonLatEquipmentReports(lat, lon, depth,count,filter,startPage,forbiddenUris, new Continuation<Response<EquipmentReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<EquipmentReports> result = (Response<EquipmentReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriEquipmentReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.equipmentReportsApi.getCoverageLonLatUriEquipmentReports(lat, lon, uri, depth,count,filter,startPage,forbiddenUris, new Continuation<Response<EquipmentReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<EquipmentReports> result = (Response<EquipmentReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionEquipmentReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.equipmentReportsApi.getCoverageRegionEquipmentReports(region, depth,count,filter,startPage,forbiddenUris, new Continuation<Response<EquipmentReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<EquipmentReports> result = (Response<EquipmentReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriEquipmentReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.equipmentReportsApi.getCoverageRegionUriEquipmentReports(region, uri, depth,count,filter,startPage,forbiddenUris, new Continuation<Response<EquipmentReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<EquipmentReports> result = (Response<EquipmentReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatGeoStatus(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.geoStatusApi.getCoverageLonLatGeoStatus(lat, lon,  new Continuation<Response<GeoStatus_1>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<GeoStatus_1> result = (Response<GeoStatus_1>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionGeoStatus(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.geoStatusApi.getCoverageRegionGeoStatus(region,  new Continuation<Response<GeoStatus_1>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<GeoStatus_1> result = (Response<GeoStatus_1>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatIsochrones(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.graphicalIsochroneApi.getCoverageLonLatIsochrones(lat, lon, from,to,datetime,datetimeRepresents,maxNbTransfers,minNbTransfers,firstSectionMode,lastSectionMode,maxDurationToPt,maxWalkingDurationToPt,maxBikeDurationToPt,maxBssDurationToPt,maxCarDurationToPt,maxRidesharingDurationToPt,maxCarNoParkDurationToPt,maxTaxiDurationToPt,walkingSpeed,bikeSpeed,bssSpeed,carSpeed,ridesharingSpeed,carNoParkSpeed,taxiSpeed,forbiddenUris,allowedId,disruptionActive,dataFreshness,maxDuration,wheelchair,travelerType,directPath,freeRadiusFrom,freeRadiusTo,directPathMode,partnerServices,minDuration,boundaryDuration, new Continuation<Response<GraphicalIsrochone_1>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<GraphicalIsrochone_1> result = (Response<GraphicalIsrochone_1>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionIsochrones(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.graphicalIsochroneApi.getCoverageRegionIsochrones(region, from,to,datetime,datetimeRepresents,maxNbTransfers,minNbTransfers,firstSectionMode,lastSectionMode,maxDurationToPt,maxWalkingDurationToPt,maxBikeDurationToPt,maxBssDurationToPt,maxCarDurationToPt,maxRidesharingDurationToPt,maxCarNoParkDurationToPt,maxTaxiDurationToPt,walkingSpeed,bikeSpeed,bssSpeed,carSpeed,ridesharingSpeed,carNoParkSpeed,taxiSpeed,forbiddenUris,allowedId,disruptionActive,dataFreshness,maxDuration,wheelchair,travelerType,directPath,freeRadiusFrom,freeRadiusTo,directPathMode,partnerServices,minDuration,boundaryDuration, new Continuation<Response<GraphicalIsrochone_1>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<GraphicalIsrochone_1> result = (Response<GraphicalIsrochone_1>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatHeatMaps(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.heatMapApi.getCoverageLonLatHeatMaps(lat, lon, from,to,datetime,datetimeRepresents,maxNbTransfers,minNbTransfers,firstSectionMode,lastSectionMode,maxDurationToPt,maxWalkingDurationToPt,maxBikeDurationToPt,maxBssDurationToPt,maxCarDurationToPt,maxRidesharingDurationToPt,maxCarNoParkDurationToPt,maxTaxiDurationToPt,walkingSpeed,bikeSpeed,bssSpeed,carSpeed,ridesharingSpeed,carNoParkSpeed,taxiSpeed,forbiddenUris,allowedId,disruptionActive,dataFreshness,maxDuration,wheelchair,travelerType,directPath,freeRadiusFrom,freeRadiusTo,directPathMode,partnerServices,resolution, new Continuation<Response<HeatMap_1>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<HeatMap_1> result = (Response<HeatMap_1>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionHeatMaps(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.heatMapApi.getCoverageRegionHeatMaps(region, from,to,datetime,datetimeRepresents,maxNbTransfers,minNbTransfers,firstSectionMode,lastSectionMode,maxDurationToPt,maxWalkingDurationToPt,maxBikeDurationToPt,maxBssDurationToPt,maxCarDurationToPt,maxRidesharingDurationToPt,maxCarNoParkDurationToPt,maxTaxiDurationToPt,walkingSpeed,bikeSpeed,bssSpeed,carSpeed,ridesharingSpeed,carNoParkSpeed,taxiSpeed,forbiddenUris,allowedId,disruptionActive,dataFreshness,maxDuration,wheelchair,travelerType,directPath,freeRadiusFrom,freeRadiusTo,directPathMode,partnerServices,resolution, new Continuation<Response<HeatMap_1>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<HeatMap_1> result = (Response<HeatMap_1>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatJourneyPatternPoints(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternPointsApi.getCoverageLonLatJourneyPatternPoints(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<JourneyPatternPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatternPoints> result = (Response<JourneyPatternPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatJourneyPatternPointsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternPointsApi.getCoverageLonLatJourneyPatternPointsId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<JourneyPatternPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatternPoints> result = (Response<JourneyPatternPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriJourneyPatternPoints(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternPointsApi.getCoverageLonLatUriJourneyPatternPoints(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<JourneyPatternPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatternPoints> result = (Response<JourneyPatternPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriJourneyPatternPointsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternPointsApi.getCoverageLonLatUriJourneyPatternPointsId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<JourneyPatternPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatternPoints> result = (Response<JourneyPatternPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionJourneyPatternPoints(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternPointsApi.getCoverageRegionJourneyPatternPoints(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<JourneyPatternPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatternPoints> result = (Response<JourneyPatternPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionJourneyPatternPointsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternPointsApi.getCoverageRegionJourneyPatternPointsId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<JourneyPatternPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatternPoints> result = (Response<JourneyPatternPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriJourneyPatternPoints(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternPointsApi.getCoverageRegionUriJourneyPatternPoints(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<JourneyPatternPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatternPoints> result = (Response<JourneyPatternPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriJourneyPatternPointsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternPointsApi.getCoverageRegionUriJourneyPatternPointsId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<JourneyPatternPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatternPoints> result = (Response<JourneyPatternPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatJourneyPatterns(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternsApi.getCoverageLonLatJourneyPatterns(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<JourneyPatterns>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatterns> result = (Response<JourneyPatterns>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatJourneyPatternsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternsApi.getCoverageLonLatJourneyPatternsId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<JourneyPatterns>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatterns> result = (Response<JourneyPatterns>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriJourneyPatterns(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternsApi.getCoverageLonLatUriJourneyPatterns(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<JourneyPatterns>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatterns> result = (Response<JourneyPatterns>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriJourneyPatternsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternsApi.getCoverageLonLatUriJourneyPatternsId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<JourneyPatterns>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatterns> result = (Response<JourneyPatterns>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionJourneyPatterns(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternsApi.getCoverageRegionJourneyPatterns(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<JourneyPatterns>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatterns> result = (Response<JourneyPatterns>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionJourneyPatternsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternsApi.getCoverageRegionJourneyPatternsId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<JourneyPatterns>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatterns> result = (Response<JourneyPatterns>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriJourneyPatterns(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternsApi.getCoverageRegionUriJourneyPatterns(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<JourneyPatterns>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatterns> result = (Response<JourneyPatterns>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriJourneyPatternsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeyPatternsApi.getCoverageRegionUriJourneyPatternsId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<JourneyPatterns>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<JourneyPatterns> result = (Response<JourneyPatterns>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatJourneys(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeysApi.getCoverageLonLatJourneys(lat, lon, from,to,datetime,datetimeRepresents,maxNbTransfers,minNbTransfers,firstSectionMode,lastSectionMode,maxDurationToPt,maxWalkingDurationToPt,maxBikeDurationToPt,maxBssDurationToPt,maxCarDurationToPt,maxRidesharingDurationToPt,maxCarNoParkDurationToPt,maxTaxiDurationToPt,walkingSpeed,bikeSpeed,bssSpeed,carSpeed,ridesharingSpeed,carNoParkSpeed,taxiSpeed,forbiddenUris,allowedId,disruptionActive,dataFreshness,maxDuration,wheelchair,travelerType,directPath,freeRadiusFrom,freeRadiusTo,directPathMode,partnerServices,count,isJourneySchedules,minNbJourneys,maxNbJourneys,bssStands,addPoiInfos,timeframeDuration,equipmentDetails,maxTaxiDirectPathDuration,maxWalkingDirectPathDuration,maxCarNoParkDirectPathDuration,maxCarDirectPathDuration,maxRidesharingDirectPathDuration,maxBssDirectPathDuration,maxBikeDirectPathDuration,depth,maxWaitingDuration, new Continuation<Response<Journeys>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Journeys> result = (Response<Journeys>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionJourneys(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeysApi.getCoverageRegionJourneys(region, from,to,datetime,datetimeRepresents,maxNbTransfers,minNbTransfers,firstSectionMode,lastSectionMode,maxDurationToPt,maxWalkingDurationToPt,maxBikeDurationToPt,maxBssDurationToPt,maxCarDurationToPt,maxRidesharingDurationToPt,maxCarNoParkDurationToPt,maxTaxiDurationToPt,walkingSpeed,bikeSpeed,bssSpeed,carSpeed,ridesharingSpeed,carNoParkSpeed,taxiSpeed,forbiddenUris,allowedId,disruptionActive,dataFreshness,maxDuration,wheelchair,travelerType,directPath,freeRadiusFrom,freeRadiusTo,directPathMode,partnerServices,count,isJourneySchedules,minNbJourneys,maxNbJourneys,bssStands,addPoiInfos,timeframeDuration,equipmentDetails,maxTaxiDirectPathDuration,maxWalkingDirectPathDuration,maxCarNoParkDirectPathDuration,maxCarDirectPathDuration,maxRidesharingDirectPathDuration,maxBssDirectPathDuration,maxBikeDirectPathDuration,depth,maxWaitingDuration, new Continuation<Response<Journeys>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Journeys> result = (Response<Journeys>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void journeys(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.journeysApi.getJourneys(from,to,datetime,datetimeRepresents,maxNbTransfers,minNbTransfers,firstSectionMode,lastSectionMode,maxDurationToPt,maxWalkingDurationToPt,maxBikeDurationToPt,maxBssDurationToPt,maxCarDurationToPt,maxRidesharingDurationToPt,maxCarNoParkDurationToPt,maxTaxiDurationToPt,walkingSpeed,bikeSpeed,bssSpeed,carSpeed,ridesharingSpeed,carNoParkSpeed,taxiSpeed,forbiddenUris,allowedId,disruptionActive,dataFreshness,maxDuration,wheelchair,travelerType,directPath,freeRadiusFrom,freeRadiusTo,directPathMode,partnerServices,count,isJourneySchedules,minNbJourneys,maxNbJourneys,bssStands,addPoiInfos,timeframeDuration,equipmentDetails,maxTaxiDirectPathDuration,maxWalkingDirectPathDuration,maxCarNoParkDirectPathDuration,maxCarDirectPathDuration,maxRidesharingDirectPathDuration,maxBssDirectPathDuration,maxBikeDirectPathDuration,depth,maxWaitingDuration, new Continuation<Response<Journeys>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Journeys> result = (Response<Journeys>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatLineGroups(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.lineGroupsApi.getCoverageLonLatLineGroups(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<LineGroups>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<LineGroups> result = (Response<LineGroups>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatLineGroupsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.lineGroupsApi.getCoverageLonLatLineGroupsId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<LineGroups>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<LineGroups> result = (Response<LineGroups>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriLineGroups(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.lineGroupsApi.getCoverageLonLatUriLineGroups(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<LineGroups>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<LineGroups> result = (Response<LineGroups>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriLineGroupsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.lineGroupsApi.getCoverageLonLatUriLineGroupsId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<LineGroups>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<LineGroups> result = (Response<LineGroups>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionLineGroups(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.lineGroupsApi.getCoverageRegionLineGroups(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<LineGroups>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<LineGroups> result = (Response<LineGroups>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionLineGroupsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.lineGroupsApi.getCoverageRegionLineGroupsId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<LineGroups>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<LineGroups> result = (Response<LineGroups>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriLineGroups(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.lineGroupsApi.getCoverageRegionUriLineGroups(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<LineGroups>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<LineGroups> result = (Response<LineGroups>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriLineGroupsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.lineGroupsApi.getCoverageRegionUriLineGroupsId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<LineGroups>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<LineGroups> result = (Response<LineGroups>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void lineGroups(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.lineGroupsApi.getLineGroups(startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<LineGroups>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<LineGroups> result = (Response<LineGroups>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatLineReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.lineReportsApi.getCoverageLonLatLineReports(lat, lon, depth,count,startPage,forbiddenUris,disableGeojson,since,until, new Continuation<Response<LineReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<LineReports> result = (Response<LineReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriLineReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.lineReportsApi.getCoverageLonLatUriLineReports(lat, lon, uri, depth,count,startPage,forbiddenUris,disableGeojson,since,until, new Continuation<Response<LineReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<LineReports> result = (Response<LineReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionLineReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.lineReportsApi.getCoverageRegionLineReports(region, depth,count,startPage,forbiddenUris,disableGeojson,since,until, new Continuation<Response<LineReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<LineReports> result = (Response<LineReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriLineReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.lineReportsApi.getCoverageRegionUriLineReports(region, uri, depth,count,startPage,forbiddenUris,disableGeojson,since,until, new Continuation<Response<LineReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<LineReports> result = (Response<LineReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatLines(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.linesApi.getCoverageLonLatLines(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Lines>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Lines> result = (Response<Lines>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatLinesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.linesApi.getCoverageLonLatLinesId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Lines>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Lines> result = (Response<Lines>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriLines(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.linesApi.getCoverageLonLatUriLines(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Lines>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Lines> result = (Response<Lines>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriLinesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.linesApi.getCoverageLonLatUriLinesId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Lines>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Lines> result = (Response<Lines>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionLines(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.linesApi.getCoverageRegionLines(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Lines>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Lines> result = (Response<Lines>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionLinesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.linesApi.getCoverageRegionLinesId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Lines>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Lines> result = (Response<Lines>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriLines(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.linesApi.getCoverageRegionUriLines(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Lines>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Lines> result = (Response<Lines>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriLinesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.linesApi.getCoverageRegionUriLinesId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Lines>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Lines> result = (Response<Lines>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void lines(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.linesApi.getLines(startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Lines>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Lines> result = (Response<Lines>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatNetworks(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.networksApi.getCoverageLonLatNetworks(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Networks>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Networks> result = (Response<Networks>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatNetworksId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.networksApi.getCoverageLonLatNetworksId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Networks>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Networks> result = (Response<Networks>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriNetworks(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.networksApi.getCoverageLonLatUriNetworks(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Networks>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Networks> result = (Response<Networks>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriNetworksId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.networksApi.getCoverageLonLatUriNetworksId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Networks>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Networks> result = (Response<Networks>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionNetworks(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.networksApi.getCoverageRegionNetworks(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Networks>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Networks> result = (Response<Networks>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionNetworksId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.networksApi.getCoverageRegionNetworksId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Networks>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Networks> result = (Response<Networks>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriNetworks(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.networksApi.getCoverageRegionUriNetworks(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Networks>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Networks> result = (Response<Networks>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriNetworksId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.networksApi.getCoverageRegionUriNetworksId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Networks>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Networks> result = (Response<Networks>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void networks(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.networksApi.getNetworks(startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Networks>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Networks> result = (Response<Networks>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatArrivals(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.nextArrivalsApi.getCoverageLonLatArrivals(lat, lon, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<Arrivals>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Arrivals> result = (Response<Arrivals>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriArrivals(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.nextArrivalsApi.getCoverageLonLatUriArrivals(lat, lon, uri, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<Arrivals>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Arrivals> result = (Response<Arrivals>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionArrivals(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.nextArrivalsApi.getCoverageRegionArrivals(region, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<Arrivals>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Arrivals> result = (Response<Arrivals>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriArrivals(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.nextArrivalsApi.getCoverageRegionUriArrivals(region, uri, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<Arrivals>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Arrivals> result = (Response<Arrivals>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatDepartures(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.nextDeparturesApi.getCoverageLonLatDepartures(lat, lon, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<Departures>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Departures> result = (Response<Departures>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriDepartures(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.nextDeparturesApi.getCoverageLonLatUriDepartures(lat, lon, uri, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<Departures>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Departures> result = (Response<Departures>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionDepartures(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.nextDeparturesApi.getCoverageRegionDepartures(region, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<Departures>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Departures> result = (Response<Departures>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriDepartures(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.nextDeparturesApi.getCoverageRegionUriDepartures(region, uri, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<Departures>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Departures> result = (Response<Departures>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatPhysicalModes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.physicalModesApi.getCoverageLonLatPhysicalModes(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<PhysicalModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PhysicalModes> result = (Response<PhysicalModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatPhysicalModesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.physicalModesApi.getCoverageLonLatPhysicalModesId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<PhysicalModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PhysicalModes> result = (Response<PhysicalModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriPhysicalModes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.physicalModesApi.getCoverageLonLatUriPhysicalModes(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<PhysicalModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PhysicalModes> result = (Response<PhysicalModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriPhysicalModesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.physicalModesApi.getCoverageLonLatUriPhysicalModesId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<PhysicalModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PhysicalModes> result = (Response<PhysicalModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionPhysicalModes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.physicalModesApi.getCoverageRegionPhysicalModes(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<PhysicalModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PhysicalModes> result = (Response<PhysicalModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionPhysicalModesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.physicalModesApi.getCoverageRegionPhysicalModesId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<PhysicalModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PhysicalModes> result = (Response<PhysicalModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriPhysicalModes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.physicalModesApi.getCoverageRegionUriPhysicalModes(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<PhysicalModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PhysicalModes> result = (Response<PhysicalModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriPhysicalModesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.physicalModesApi.getCoverageRegionUriPhysicalModesId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<PhysicalModes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PhysicalModes> result = (Response<PhysicalModes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatPlacesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.placeUriApi.getCoverageLonLatPlacesId(lat, lon, id, bssStands,addPoiInfos,disableGeojson,disableDisruption, new Continuation<Response<Places>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Places> result = (Response<Places>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionPlacesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.placeUriApi.getCoverageRegionPlacesId(region, id, bssStands,addPoiInfos,disableGeojson,disableDisruption, new Continuation<Response<Places>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Places> result = (Response<Places>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void placesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.placeUriApi.getPlacesId(id, bssStands,addPoiInfos,disableGeojson,disableDisruption, new Continuation<Response<Places>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Places> result = (Response<Places>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatPlaces(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.placesApi.getCoverageLonLatPlaces(lat, lon, q,type,count,adminUri,depth,disableGeojson,from,shape,shapeScope, new Continuation<Response<Places>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Places> result = (Response<Places>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionPlaces(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.placesApi.getCoverageRegionPlaces(region, q,type,count,adminUri,depth,disableGeojson,from,shape,shapeScope, new Continuation<Response<Places>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Places> result = (Response<Places>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void places(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.placesApi.getPlaces(q,type,count,adminUri,depth,disableGeojson,from,shape,shapeScope, new Continuation<Response<Places>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Places> result = (Response<Places>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coordLonLatPlacesNearby(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.placesNearbyApi.getCoordLonLatPlacesNearby(lat, lon, type,filter,distance,count,depth,startPage,bssStands,addPoiInfos,disableGeojson,disableDisruption, new Continuation<Response<PlacesNearby>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PlacesNearby> result = (Response<PlacesNearby>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coordsLonLatPlacesNearby(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.placesNearbyApi.getCoordsLonLatPlacesNearby(lat, lon, type,filter,distance,count,depth,startPage,bssStands,addPoiInfos,disableGeojson,disableDisruption, new Continuation<Response<PlacesNearby>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PlacesNearby> result = (Response<PlacesNearby>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatPlacesNearby(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.placesNearbyApi.getCoverageLonLatPlacesNearby(lat, lon, type,filter,distance,count,depth,startPage,bssStands,addPoiInfos,disableGeojson,disableDisruption, new Continuation<Response<PlacesNearby>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PlacesNearby> result = (Response<PlacesNearby>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriPlacesNearby(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.placesNearbyApi.getCoverageLonLatUriPlacesNearby(lat, lon, uri, type,filter,distance,count,depth,startPage,bssStands,addPoiInfos,disableGeojson,disableDisruption, new Continuation<Response<PlacesNearby>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PlacesNearby> result = (Response<PlacesNearby>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionPlacesNearby(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.placesNearbyApi.getCoverageRegionPlacesNearby(region, type,filter,distance,count,depth,startPage,bssStands,addPoiInfos,disableGeojson,disableDisruption, new Continuation<Response<PlacesNearby>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PlacesNearby> result = (Response<PlacesNearby>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriPlacesNearby(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.placesNearbyApi.getCoverageRegionUriPlacesNearby(region, uri, type,filter,distance,count,depth,startPage,bssStands,addPoiInfos,disableGeojson,disableDisruption, new Continuation<Response<PlacesNearby>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PlacesNearby> result = (Response<PlacesNearby>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatPoiTypes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poiTypesApi.getCoverageLonLatPoiTypes(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<PoiTypes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PoiTypes> result = (Response<PoiTypes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatPoiTypesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poiTypesApi.getCoverageLonLatPoiTypesId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<PoiTypes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PoiTypes> result = (Response<PoiTypes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriPoiTypes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poiTypesApi.getCoverageLonLatUriPoiTypes(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<PoiTypes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PoiTypes> result = (Response<PoiTypes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriPoiTypesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poiTypesApi.getCoverageLonLatUriPoiTypesId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<PoiTypes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PoiTypes> result = (Response<PoiTypes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionPoiTypes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poiTypesApi.getCoverageRegionPoiTypes(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<PoiTypes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PoiTypes> result = (Response<PoiTypes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionPoiTypesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poiTypesApi.getCoverageRegionPoiTypesId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<PoiTypes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PoiTypes> result = (Response<PoiTypes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriPoiTypes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poiTypesApi.getCoverageRegionUriPoiTypes(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<PoiTypes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PoiTypes> result = (Response<PoiTypes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriPoiTypesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poiTypesApi.getCoverageRegionUriPoiTypesId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<PoiTypes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PoiTypes> result = (Response<PoiTypes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatPois(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poisApi.getCoverageLonLatPois(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId,bssStands,addPoiInfos, new Continuation<Response<Pois>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Pois> result = (Response<Pois>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatPoisId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poisApi.getCoverageLonLatPoisId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId,bssStands,addPoiInfos, new Continuation<Response<Pois>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Pois> result = (Response<Pois>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriPois(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poisApi.getCoverageLonLatUriPois(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId,bssStands,addPoiInfos, new Continuation<Response<Pois>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Pois> result = (Response<Pois>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriPoisId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poisApi.getCoverageLonLatUriPoisId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId,bssStands,addPoiInfos, new Continuation<Response<Pois>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Pois> result = (Response<Pois>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionPois(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poisApi.getCoverageRegionPois(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId,bssStands,addPoiInfos, new Continuation<Response<Pois>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Pois> result = (Response<Pois>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionPoisId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poisApi.getCoverageRegionPoisId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId,bssStands,addPoiInfos, new Continuation<Response<Pois>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Pois> result = (Response<Pois>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriPois(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poisApi.getCoverageRegionUriPois(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId,bssStands,addPoiInfos, new Continuation<Response<Pois>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Pois> result = (Response<Pois>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriPoisId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.poisApi.getCoverageRegionUriPoisId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId,bssStands,addPoiInfos, new Continuation<Response<Pois>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Pois> result = (Response<Pois>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatPtObjects(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.ptobjectsApi.getCoverageLonLatPtObjects(lat, lon, q,type,count,adminUri,depth,disableGeojson,disableDisruption,filter, new Continuation<Response<PtObjects>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PtObjects> result = (Response<PtObjects>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionPtObjects(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.ptobjectsApi.getCoverageRegionPtObjects(region, q,type,count,adminUri,depth,disableGeojson,disableDisruption,filter, new Continuation<Response<PtObjects>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<PtObjects> result = (Response<PtObjects>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriRouteSchedules(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.routeSchedulesApi.getCoverageLonLatUriRouteSchedules(lat, lon, uri, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<RouteSchedules>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<RouteSchedules> result = (Response<RouteSchedules>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriRouteSchedules(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.routeSchedulesApi.getCoverageRegionUriRouteSchedules(region, uri, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<RouteSchedules>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<RouteSchedules> result = (Response<RouteSchedules>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void routeSchedules(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.routeSchedulesApi.getRouteSchedules(filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<RouteSchedules>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<RouteSchedules> result = (Response<RouteSchedules>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatRoutes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.routesApi.getCoverageLonLatRoutes(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Routes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Routes> result = (Response<Routes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatRoutesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.routesApi.getCoverageLonLatRoutesId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Routes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Routes> result = (Response<Routes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriRoutes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.routesApi.getCoverageLonLatUriRoutes(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Routes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Routes> result = (Response<Routes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriRoutesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.routesApi.getCoverageLonLatUriRoutesId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Routes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Routes> result = (Response<Routes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionRoutes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.routesApi.getCoverageRegionRoutes(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Routes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Routes> result = (Response<Routes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionRoutesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.routesApi.getCoverageRegionRoutesId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Routes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Routes> result = (Response<Routes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriRoutes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.routesApi.getCoverageRegionUriRoutes(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Routes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Routes> result = (Response<Routes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriRoutesId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.routesApi.getCoverageRegionUriRoutesId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<Routes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Routes> result = (Response<Routes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void routes(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.routesApi.getRoutes(startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<Routes>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Routes> result = (Response<Routes>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatStopAreas(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopAreasApi.getCoverageLonLatStopAreas(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<StopAreas>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopAreas> result = (Response<StopAreas>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatStopAreasId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopAreasApi.getCoverageLonLatStopAreasId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<StopAreas>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopAreas> result = (Response<StopAreas>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriStopAreas(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopAreasApi.getCoverageLonLatUriStopAreas(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<StopAreas>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopAreas> result = (Response<StopAreas>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriStopAreasId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopAreasApi.getCoverageLonLatUriStopAreasId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<StopAreas>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopAreas> result = (Response<StopAreas>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionStopAreas(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopAreasApi.getCoverageRegionStopAreas(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<StopAreas>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopAreas> result = (Response<StopAreas>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionStopAreasId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopAreasApi.getCoverageRegionStopAreasId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<StopAreas>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopAreas> result = (Response<StopAreas>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriStopAreas(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopAreasApi.getCoverageRegionUriStopAreas(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<StopAreas>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopAreas> result = (Response<StopAreas>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriStopAreasId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopAreasApi.getCoverageRegionUriStopAreasId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<StopAreas>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopAreas> result = (Response<StopAreas>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void stopAreas(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopAreasApi.getStopAreas(startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<StopAreas>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopAreas> result = (Response<StopAreas>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatStopPoints(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopPointsApi.getCoverageLonLatStopPoints(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<StopPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopPoints> result = (Response<StopPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatStopPointsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopPointsApi.getCoverageLonLatStopPointsId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<StopPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopPoints> result = (Response<StopPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriStopPoints(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopPointsApi.getCoverageLonLatUriStopPoints(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<StopPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopPoints> result = (Response<StopPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriStopPointsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopPointsApi.getCoverageLonLatUriStopPointsId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<StopPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopPoints> result = (Response<StopPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionStopPoints(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopPointsApi.getCoverageRegionStopPoints(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<StopPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopPoints> result = (Response<StopPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionStopPointsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopPointsApi.getCoverageRegionStopPointsId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<StopPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopPoints> result = (Response<StopPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriStopPoints(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopPointsApi.getCoverageRegionUriStopPoints(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<StopPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopPoints> result = (Response<StopPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriStopPointsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopPointsApi.getCoverageRegionUriStopPointsId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags,originalId, new Continuation<Response<StopPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopPoints> result = (Response<StopPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void stopPoints(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopPointsApi.getStopPoints(startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags,originalId, new Continuation<Response<StopPoints>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopPoints> result = (Response<StopPoints>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriStopSchedules(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopSchedulesApi.getCoverageLonLatUriStopSchedules(lat, lon, uri, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<StopSchedules>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopSchedules> result = (Response<StopSchedules>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriStopSchedules(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopSchedulesApi.getCoverageRegionUriStopSchedules(region, uri, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<StopSchedules>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopSchedules> result = (Response<StopSchedules>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void stopSchedules(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.stopSchedulesApi.getStopSchedules(filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<StopSchedules>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<StopSchedules> result = (Response<StopSchedules>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriTerminusSchedules(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.terminusSchedulesApi.getCoverageLonLatUriTerminusSchedules(lat, lon, uri, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<TerminusSchedules>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<TerminusSchedules> result = (Response<TerminusSchedules>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriTerminusSchedules(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.terminusSchedulesApi.getCoverageRegionUriTerminusSchedules(region, uri, filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<TerminusSchedules>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<TerminusSchedules> result = (Response<TerminusSchedules>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void terminusSchedules(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.terminusSchedulesApi.getTerminusSchedules(filter,fromDatetime,untilDatetime,duration,depth,count,startPage,maxDateTimes,forbiddenId,forbiddenUris,calendar,distance,showCodes,dataFreshness,itemsPerSchedule,disableGeojson,directionType, new Continuation<Response<TerminusSchedules>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<TerminusSchedules> result = (Response<TerminusSchedules>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatTrafficReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.trafficReportApi.getCoverageLonLatTrafficReports(lat, lon, depth,count,startPage,forbiddenId,forbiddenUris,distance,disableGeojson,since,until, new Continuation<Response<TrafficReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<TrafficReports> result = (Response<TrafficReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriTrafficReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.trafficReportApi.getCoverageLonLatUriTrafficReports(lat, lon, uri, depth,count,startPage,forbiddenId,forbiddenUris,distance,disableGeojson,since,until, new Continuation<Response<TrafficReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<TrafficReports> result = (Response<TrafficReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionTrafficReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.trafficReportApi.getCoverageRegionTrafficReports(region, depth,count,startPage,forbiddenId,forbiddenUris,distance,disableGeojson,since,until, new Continuation<Response<TrafficReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<TrafficReports> result = (Response<TrafficReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriTrafficReports(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.trafficReportApi.getCoverageRegionUriTrafficReports(region, uri, depth,count,startPage,forbiddenId,forbiddenUris,distance,disableGeojson,since,until, new Continuation<Response<TrafficReports>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<TrafficReports> result = (Response<TrafficReports>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatTrips(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.tripsApi.getCoverageLonLatTrips(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Trips>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Trips> result = (Response<Trips>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatTripsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.tripsApi.getCoverageLonLatTripsId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Trips>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Trips> result = (Response<Trips>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriTrips(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.tripsApi.getCoverageLonLatUriTrips(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Trips>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Trips> result = (Response<Trips>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriTripsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.tripsApi.getCoverageLonLatUriTripsId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Trips>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Trips> result = (Response<Trips>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionTrips(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.tripsApi.getCoverageRegionTrips(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Trips>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Trips> result = (Response<Trips>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionTripsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.tripsApi.getCoverageRegionTripsId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Trips>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Trips> result = (Response<Trips>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriTrips(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.tripsApi.getCoverageRegionUriTrips(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<Trips>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Trips> result = (Response<Trips>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriTripsId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.tripsApi.getCoverageRegionUriTripsId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<Trips>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<Trips> result = (Response<Trips>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriVehicleJourneys(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.vehicleJourneysApi.getCoverageLonLatUriVehicleJourneys(lat, lon, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<VehicleJourneys>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<VehicleJourneys> result = (Response<VehicleJourneys>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatUriVehicleJourneysId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.vehicleJourneysApi.getCoverageLonLatUriVehicleJourneysId(lat, lon, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<VehicleJourneys>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<VehicleJourneys> result = (Response<VehicleJourneys>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatVehicleJourneys(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.vehicleJourneysApi.getCoverageLonLatVehicleJourneys(lat, lon, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<VehicleJourneys>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<VehicleJourneys> result = (Response<VehicleJourneys>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageLonLatVehicleJourneysId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.vehicleJourneysApi.getCoverageLonLatVehicleJourneysId(lat, lon, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<VehicleJourneys>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<VehicleJourneys> result = (Response<VehicleJourneys>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriVehicleJourneys(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.vehicleJourneysApi.getCoverageRegionUriVehicleJourneys(region, uri, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<VehicleJourneys>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<VehicleJourneys> result = (Response<VehicleJourneys>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionUriVehicleJourneysId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.vehicleJourneysApi.getCoverageRegionUriVehicleJourneysId(region, uri, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<VehicleJourneys>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<VehicleJourneys> result = (Response<VehicleJourneys>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionVehicleJourneys(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.vehicleJourneysApi.getCoverageRegionVehicleJourneys(region, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<VehicleJourneys>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<VehicleJourneys> result = (Response<VehicleJourneys>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void coverageRegionVehicleJourneysId(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.vehicleJourneysApi.getCoverageRegionVehicleJourneysId(region, id, startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,tags, new Continuation<Response<VehicleJourneys>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<VehicleJourneys> result = (Response<VehicleJourneys>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
    final private void vehicleJourneys(final JSONObject params, final CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    this.expertSdk.vehicleJourneysApi.getVehicleJourneys(startPage,count,depth,forbiddenId,forbiddenUris,externalCode,headsign,showCodes,odtLevel,dataFreshness,distance,since,until,disableGeojson,disableDisruption,filter,tags, new Continuation<Response<VehicleJourneys>>() {
                        
                        @NotNull
                        @Override
                        public CoroutineContext getContext() {
                            return EmptyCoroutineContext.INSTANCE;
                        }

                        @Override
                        public void resumeWith(@NotNull Object o) {
                            Response<VehicleJourneys> result = (Response<VehicleJourneys>) o;

                            if (result.isSuccessful()) {
                                try {
                                    JSONObject jsonObject = new JSONObject(result.body());
                                    callbackContext.success(jsonObject);
                                } catch (Exception e) {
                                    String errorMessage = "Problem during response parsing";
                                    callbackContext.error(errorMessage);
                                }
                            } else {
                                String errorMessage = "Problem during response parsing 2";
                                callbackContext.error(errorMessage);
                            }
                        }
                    });
                } catch (Exception e) {
                    String errorMessage = "Problem during request building | " + String.valueOf(e.hashCode()) + ": " + e.getMessage();
                    callbackContext.error(errorMessage);
                }
            }
        });
    }
}