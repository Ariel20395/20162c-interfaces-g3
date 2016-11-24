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
import retrofit.http.Path;
import retrofit.http.Query;
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


    @GET("/calificaciones")
    void getCalificaciones(@Query("usuario") String usuario, Callback<List<Calificacion>> handlerRespuesta);

    @PUT("/calificaciones?id={id}&puntuacion={puntuacion}&detalle={detalle}&evaluado={evaluado}")
    void editarCalificacion(@Path("id") String id, @Path("puntuacion") String puntuacion,
                            @Path("detalle") String detalle, @Path("evaluado") String evaluado,
                            Callback<Calificacion> handlerRespuesta);

}
