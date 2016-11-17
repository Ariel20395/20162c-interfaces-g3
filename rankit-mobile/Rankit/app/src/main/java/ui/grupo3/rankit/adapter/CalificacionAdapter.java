package ui.grupo3.rankit.adapter;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

import java.util.List;

import ui.grupo3.rankit.R;
import ui.grupo3.rankit.model.Calificacion;

/**
 * Created by migue on 17/11/16.
 */

public class CalificacionAdapter extends AbstractListAdapter<Calificacion> {
    public CalificacionAdapter(Context context, List<Calificacion> calificaciones) {
        super(context, calificaciones);
    }
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        Calificacion calificacion = (Calificacion) getItem(position);
        View row = generateRow(R.layout.calificacion_list_content, parent);
        setColumnTextView(row, R.id.ofrecido, calificacion.getOfrecido());
        return row;
    }

}
