rankitApp.factory('Usuarios', function($resource) {
    return $resource('/usuarios');
});

rankitApp.factory('Ranking', function($resource) {
    return $resource('/ranking/:nombre:tipo:calificaciones:ranking');
});