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
import ui.grupo3.rankit.model.Calificacion;
import ui.grupo3.rankit.model.EntidadDominioTo;
import ui.grupo3.rankit.model.Usuario;

/**
 * Created by migue on 17/11/16.
 */

public interface RankitService {
    @PUT("/usuarios")
        void registrarUsuario(@Body Usuario usuario, Callback<Void> handler);


    @POST("/usuarios")
        void loginUsuario(@Body Usuario usuario, Callback<EntidadDominioTo> handlerRespuesta);

    @FormUrlEncoded
    @GET("/calificaciones")
        void getCalificaciones(@Field("usuario") String nombreUsuario, Callback<List<Calificacion>> handlerRespuesta);

    @FormUrlEncoded
    @PUT("/calificaciones")
        void editarCalificacion(@Field("id") String id, @Field("puntuacion") String puntuacion,
                                @Field("detalle") String detalle, @Field("evaluado") String evaluado,
                                Callback<Calificacion> handlerRespuesta);

}
