rankitApp.service('rankitService', function($http) {
    
    this.findAll = function(callback) {
        $http.get('/ranking').then(callback);
    };
    
    this.findRanking = function(ranking, callback) {
     $http.get('/ranking?nombre='+ranking.nombre + 
               '&tipo=' + ranking.tipo +
               '&calificaciones='+ ranking.calificaciones +
               '&ranking='+ ranking.ranking).then(callback);
    };

});

rankitApp.service('usuarioService', function($http) {
    
    this.loguearUsuario = function(usuario) {
        return $http.post('/usuarios', {nombre: usuario.nombreUsuario, password: usuario.passwordUsuario});
    };
    
    this.registrarUsuario = function(usuario) {
        return $http.put('/usuarios', {nombre: usuario.nombreUsuario, password: usuario.passwordUsuario});
    };
});

rankitApp.service('calificacionService', function($http) {
    
    this.findCalificacion = function(usuario, callback) {
        $http.get('/calificaciones?usuario='+ usuario.nombreUsuario).then(callback)  
    }
    
    this.crearCalificacion = function(calificacion) {
        return $http.post('/calificaciones?puntuacion='+calificacion.puntuacion+
                '&detalle='+calificacion.detalle+
                '&evaluado='+calificacion.evaluado+
                '&usuario='+calificacion.usuario)
    };
    
    this.editarCalificacion = function(calificacion) {
        return $http.put('/calificaciones?id='+calificacion.id+
                        'puntuacion='+calificacion.puntuacion+
                        '&detalle='+calificacion.detalle+
                        '&evaluado='+calificacion.evaluado);
    };
    
    this.eliminarCalificacion = function(calificacion) {
        return $http.delete('calificaciones/'+calificacion.id);
    };
});
