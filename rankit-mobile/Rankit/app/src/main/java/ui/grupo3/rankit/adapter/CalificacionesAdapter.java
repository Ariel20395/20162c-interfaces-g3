package ui.grupo3.rankit.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import ui.grupo3.rankit.R;
import ui.grupo3.rankit.model.Calificacion;

/**
 * Created by migue on 19/11/16.
 */

public class CalificacionesAdapter extends BaseAdapter implements Filterable {

    private Context context;
    private int layoutResourceId;
    private List<Calificacion> calificaciones = new ArrayList<Calificacion>();
    private List<Calificacion> busquedaCalificaciones = new ArrayList<Calificacion>();

    public CalificacionesAdapter(Context context, int layoutResourceId, List<Calificacion> calificaciones) {
        super();

        this.context = context;
        this.layoutResourceId = layoutResourceId;
        this.calificaciones = calificaciones;
        this.busquedaCalificaciones = calificaciones;
    }

    public List<Calificacion> getCalificaciones() {
        return calificaciones;
    }

    @Override
    public Object getItem(int position) {
        return calificaciones.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public int getCount() {
        return calificaciones.size();
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View row = convertView;
        if(row == null) {
            LayoutInflater inflater = ((Activity) context).getLayoutInflater();
            row = inflater.inflate(layoutResourceId, parent, false);
        }
        Calificacion calificacion = calificaciones.get(position);
        TextView nombreOfrecido = (TextView) row.findViewById(R.id.nombre_ofrecido);
        nombreOfrecido.setText(calificacion.getOfrecido());

        return row;
    }

    public Filter getFilter() {
        return new Filter() {
            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                final FilterResults oReturn = new FilterResults();
                final List<Calificacion> results = new ArrayList<Calificacion>();
                if (busquedaCalificaciones == null)
                    busquedaCalificaciones = calificaciones;
                if (constraint != null) {
                    if (busquedaCalificaciones != null && busquedaCalificaciones.size() > 0) {
                        for (final Calificacion g : busquedaCalificaciones) {
                            if (g.getOfrecido().toLowerCase()
                                    .contains(constraint.toString()))
                                results.add(g);
                        }
                    }
                    oReturn.values = results;
                }
                return oReturn;
            }

            @SuppressWarnings("unchecked")
            @Override
            protected void publishResults(CharSequence constraint,
                                          FilterResults results) {
                calificaciones = (ArrayList<Calificacion>) results.values;
                notifyDataSetChanged();
            }
        };
    }
}
