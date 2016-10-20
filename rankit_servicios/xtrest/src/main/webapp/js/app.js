'use strict';

/* Controllers */
var rankitApp = angular.module('rankitApp', ['ui.router']);

rankitApp.controller('BusquedaController', function (BusquedaService) {

    this.nombreOfrecido = '';
    this.calificacion = '';
    this.ranking = '';
    this.tipo = '';
    this.tiposDeOfrecidos = BusquedaService.tipos;
    this.resultados = BusquedaService.calificaciones;
    
    this.buscar = function () {
        this.resultados = BusquedaService.buscar(this.nombreOfrecido, this.tipo, this.ranking, this.calificacion);
    };

});


rankitApp.controller('LoginController', function($state, LoginService) {
   
    this.nombreUsuario = '';
    this.passUsuario = '';
    
    this.login = function() {
        LoginService.login(this.nombreUsuario, this.passUsuario);
        if(loginCorrecto) {
            $state.go("login");
        }
    };
    
    this.registrarse = function() {
        LoginService.registrar(this.nombreUsuario, this.password);
    };
    
    this.logout = function() {
        this.nombreUsuario = '';
        this.passUsuario = '';
        $state.go("logout");
    };
    
    this.calificar = function() {
        $state.go("calificar");  
    };
});