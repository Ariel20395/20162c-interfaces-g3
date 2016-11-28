package ui.grupo3.rankit.activity;


import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.SearchView;
import android.widget.TextView;
import android.widget.Toast;
import java.util.List;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;
import ui.grupo3.rankit.R;
import ui.grupo3.rankit.adapter.CalificacionesAdapter;
import ui.grupo3.rankit.model.Calificacion;
import ui.grupo3.rankit.service.ConectionRest;


public class CalificacionesListActivity extends Activity implements SearchView.OnQueryTextListener {

    private ListView lista;
    protected String usuario;
    private CalificacionesAdapter calificacionesAdapter;
    private int request_code = 1;
    private SearchView busqueda;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calificaciones_list);
        setLista();
        setBusqueda();

        Bundle bundle = getIntent().getExtras();
        this.usuario = bundle.getString("nombreUsuario");

        obtenerCalificaciones();
        
        busqueda();

        nuevaCalificacion();
    }

    private void nuevaCalificacion() {

        Button agregar = (Button) findViewById(R.id.nuevaCalificacion);

        agregar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent agregarView = new Intent(CalificacionesListActivity.this, AgregarActivity.class);

                agregarView.putExtra("nombre", usuario);

                startActivityForResult(agregarView, request_code);
            }
        });
    }


    private void busqueda() {

        busqueda.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String calificacion) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String calificacion) {
                calificacionesAdapter.getFilter().filter(calificacion);
                return false;
            }
        });
    }

    private void setBusqueda() {
         this.busqueda = (SearchView) findViewById(R.id.busqueda);
    }

    private void setLista() {
        lista = (ListView) findViewById(R.id.list);
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
        calificacionesAdapter = new CalificacionesAdapter(this, R.layout.activity_ofrecido_row, calificaciones);
        lista.setAdapter(calificacionesAdapter);
        lista.setTextFilterEnabled(true);
        setupSearchView();
        View header = (View) getLayoutInflater().inflate(R.layout.activity_calificaciones_list, null);

        OnClickEnCalificacion(calificaciones);
    }

    private void OnClickEnCalificacion(final List<Calificacion> calificaciones) {
        lista.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                Intent detalleView = new Intent(CalificacionesListActivity.this, DetalleActivity.class);

                Calificacion calificacionSeleccionada = obtenerCalificacion(position, calificaciones);

                Bundle extras = new Bundle();
                extras.putString("nombreCalificacion", calificacionSeleccionada.getOfrecido());
                extras.putString("detalle", calificacionSeleccionada.getDetalle());
                extras.putInt("puntos", calificacionSeleccionada.getPuntos());
                extras.putInt("id", calificacionSeleccionada.getId());
                detalleView.putExtras(extras);

                startActivity(detalleView);
            }
        });
    }

    private Calificacion obtenerCalificacion(int ofrecidoSeleccionado, List<Calificacion> calificaciones) {
        return calificaciones.get(ofrecidoSeleccionado);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if ((requestCode == request_code) && (resultCode == RESULT_OK)){
            obtenerCalificaciones();
        }
    }

    private void setupSearchView()
    {
        busqueda.setIconifiedByDefault(false);
        busqueda.setOnQueryTextListener(this);
        busqueda.setSubmitButtonEnabled(true);
        busqueda.setQueryHint("Buscar servicio o lugar");
    }

    @Override
    public boolean onQueryTextChange(String newText)
    {

        if (TextUtils.isEmpty(newText)) {
            lista.clearTextFilter();
        } else {
            lista.setFilterText(newText);
        }
        return true;
    }

    @Override
    public boolean onQueryTextSubmit(String query)
    {
        return false;
    }
}