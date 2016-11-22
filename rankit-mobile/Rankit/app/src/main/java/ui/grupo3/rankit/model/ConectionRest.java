package ui.grupo3.rankit.model;

import retrofit.RestAdapter;
import ui.grupo3.rankit.service.RankitService;

/**
 * Created by ariel on 17/11/16.
 */

public class ConectionRest {

    public static RankitService crearService() {
        String SERVER_IP = "192.168.0.49";
        String API_URL = "http://"+ SERVER_IP +":9000";

        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build();
        RankitService service = restAdapter.create(RankitService.class);

        return service;
    }
}
