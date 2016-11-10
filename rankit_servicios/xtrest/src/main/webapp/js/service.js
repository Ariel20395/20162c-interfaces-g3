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
<<<<<<< HEAD
=======

});
>>>>>>> fccd90b819519a12e181e0c17e67c9d45dadd543

rankitApp.service('usuarioService', function($http) {
    
    this.loguearUsuario = function(usuario) {
        return $http.post('/usuarios', {nombre: usuario.nombreUsuario, password: usuario.passwordUsuario});
    };
    
    this.registrarUsuario = function(usuario) {
        return $http.put('/usuarios', {nombre: usuario.nombreUsuario, password: usuario.passwordUsuario});
    };
});

rankitApp.service('calificacionService', function($http) {
<<<<<<< HEAD
    this.findCalificacion = function(calificacion, callback) {
        $http.get('/calificaciones?usuario=' + calificacion.usuario).then(callback);  
    };
    
    this.calificar = function(calificacion, callback) {
        $http.put('/calificaciones?puntuacion=' + calificacion.puntuacion +
               '&detalle=' + calificacion.detalle +
               '&usuario=' + calificacion.usuario +
               '&evaluado=' + calificacion.evaluado).then(callback);
    };

});
=======
    
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
>>>>>>> fccd90b819519a12e181e0c17e67c9d45dadd543
