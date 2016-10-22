'use strict';
var rankitApp = angular.module('rankitApp', ['ui.router']);

/* Controllers */
rankitApp.controller('BusquedaController', function (BusquedaService) {

    this.nombreOfrecido = '';
    this.calificacion = '';
    this.ranking = '';
    this.tipo = '';
    this.tiposDeOfrecidos = BusquedaService.tipos;
    this.resultados = BusquedaService.calificaciones;
    
    this.buscar = function () {
        this.resultados = BusquedaService.buscar(this.nombreOfrecido, this.tipo, this.ranking, this.calificacion);
        this.tipo = '';
    };

});


rankitApp.controller('LoginController', function($state, LoginService) {
   
    this.usuario = {
        'nombreUsuario' : '',
        'passwordUsuario' : ''
    };
    
    this.login = function() {
        LoginService.login(this.usuario);
    };
    
    this.registrarse = function() {
        LoginService.registrar(this.usuario);
    };
    
    this.logout = function() {
        this.usuario = {
            'nombreUsuario' : '',
            'passwordUsuario' : ''
        };
        $state.go("logout");
    };
    
    this.calificar = function() {
        $state.go("calificar");  
    };
});