package ui.grupo3.rankit.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by migue on 15/11/16.
 */

public class Ofrecido {
    private String nombre;
    private List<Calificacion> calificaciones;
    private TipoOfrecido tipo;
    private Integer id;

    public Ofrecido(String unNombre, TipoOfrecido unTipoDeOfrecido) {
        this.nombre = unNombre;
        this.tipo = unTipoDeOfrecido;
        this.calificaciones = new ArrayList<Calificacion>();
        this.id = new Random().nextInt(1000);
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String unNombre) {
        this.nombre = unNombre;
    }

    public TipoOfrecido getTipo() {
        return this.tipo;
    }

    public void setTipo(TipoOfrecido unTipoDeOfrecido) {
        this.tipo = unTipoDeOfrecido;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer unId) {
        this.id = unId;
    }
}
