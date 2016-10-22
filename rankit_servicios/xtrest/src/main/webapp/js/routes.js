rankitApp.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider
        .state('logout', {
            url: "/",
            views: {
                'header': {
                    templateUrl: "/partials/logout.html",
                    controller: "LoginController as loginCtrl"
                },
                'panelBusqueda': {
                    templateUrl: "partials/busqueda.html",
                    controller: "BusquedaController as busquedaCtrl"
              }
            }
        })
    
        .state('login', {
            url: "/acceso",
            views: {
                'header': {
                    templateUrl: "/partials/login.html",
                    controller: "LoginController as loginCtrl"
                },
                'panelBusqueda': {
                    templateUrl: "partials/busqueda.html",
                    controller: "BusquedaController as busquedaCtrl"
              }
            }
        });
});
