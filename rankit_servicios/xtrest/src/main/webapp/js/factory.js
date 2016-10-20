rankitApp.factory('Usuarios', function($resource) {
    return $resource('/usuarios');
});