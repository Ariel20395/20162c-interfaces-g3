package ui.grupo3.rankit.service;

import android.telecom.Call;

import java.util.List;

import retrofit.Callback;
import retrofit.http.Body;
import retrofit.http.DELETE;
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
    void registrarUsuario(@Body Usuario usuario, Callback<Void> handlerRespuesta);


    @POST("/usuarios")
    void loginUsuario(@Body Usuario usuario, Callback<EntidadDominioTo> handlerRespuesta);


    @GET("/calificaciones")
    void getCalificaciones(@Query("usuario") String usuario, Callback<List<Calificacion>> handlerRespuesta);

    @PUT("/calificaciones")
    void editarCalificacion(@Query("id") String id, @Query("puntuacion") String puntuacion,
                            @Query("detalle") String detalle, @Query("evaluado") String evaluado,
                            Callback<Void> handlerRespuesta);

    @POST("/calificaciones")
    void agregarCalificacion(@Query("puntuacion") String id, @Query("detalle") String puntuacion,
                            @Query("evaluado") String detalle, @Query("usuario") String evaluado,
                            Callback<Void> handlerRespuesta);

    @DELETE("/calificaciones/{id}")
    void eliminarCalificacion(@Path("id") String id, Callback<Void> handlerRespuesta );
}
