package ui.grupo3.rankit.service;

import android.telecom.Call;

import java.util.List;

import retrofit.Callback;
import retrofit.http.Body;
import retrofit.http.Field;
import retrofit.http.FormUrlEncoded;
import retrofit.http.GET;
import retrofit.http.POST;
import retrofit.http.PUT;
import ui.grupo3.rankit.model.Usuario;

/**
 * Created by migue on 17/11/16.
 */

public interface RankitService {
    @PUT("/usuarios")
        void crearUsuario(@Body Usuario usuario);


    @POST("/usuarios")
        void loginUsuario(@Body Usuario usuario);

    @FormUrlEncoded
    @GET("/calificaciones")
        void getCalificaciones(@Field("usuario") String nombreUsuario);

    @FormUrlEncoded
    @PUT("/calificaciones")
        void editarCalificacion(@Field("id") String id, @Field("puntuacion") String puntuacion,
                                @Field("detalle") String detalle, @Field("evaluado") String evaluado);

}
