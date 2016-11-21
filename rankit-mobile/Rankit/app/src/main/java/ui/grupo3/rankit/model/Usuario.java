package ui.grupo3.rankit.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by migue on 15/11/16.
 */

public class Usuario {

    private String nombre;
    private String password;


    public Usuario(String nombre, String password) {

        this.nombre = nombre;
        this.password = password;

    }



    public String getNombre() {
        return nombre;
    }

    public void setNombre(String unNombre) {
        this.nombre = unNombre;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String unPassword) {
        this.password = unPassword;
    }
}
