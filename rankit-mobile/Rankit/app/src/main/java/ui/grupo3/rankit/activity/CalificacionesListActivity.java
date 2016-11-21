package ui.grupo3.rankit.activity;

import android.support.v4.app.FragmentActivity;

import android.os.Bundle;
import android.widget.Toast;

import java.util.List;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;
import ui.grupo3.rankit.R;
import ui.grupo3.rankit.model.Calificacion;
import ui.grupo3.rankit.model.ConectionRest;


public class CalificacionesListActivity extends FragmentActivity {

    protected String usuario;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calificaciones_list);

        Bundle bundle = getIntent().getExtras();
        this.usuario = bundle.getString("nombreUsuario");

        CalificacionFragment calificacionFragment = (CalificacionFragment)
                getSupportFragmentManager().findFragmentById(R.id.calificacion_list);

        if (calificacionFragment == null) {
            calificacionFragment = CalificacionFragment.newInstance();
            getSupportFragmentManager().beginTransaction()
                    .add(R.id.calificacion_list, calificacionFragment)
                    .commit();
        }
        obtenerCalificaciones();
    }

    /*  Poner esto en calificacionFragment  */
    protected void obtenerCalificaciones() {
        ConectionRest.crearService().getCalificaciones(usuario, handlearCalificaciones());
    }

    protected Callback<List<Calificacion>> handlearCalificaciones() {
        return new Callback<List<Calificacion>>() {
            @Override
            public void success(List<Calificacion> calificaciones, Response response) {
                agregarCalificaciones(calificaciones);
            }

            @Override
            public void failure(RetrofitError error) {

                Toast toast = Toast.makeText(getApplicationContext(), error.getMessage(), Toast.LENGTH_SHORT);
                toast.show();
            }
        };

    }

    private void agregarCalificaciones(List<Calificacion> calificaciones) {


    }


}
