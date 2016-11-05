(function () {
    angular
        .module('retailApp')
        .controller('LoginController', LoginController);

    LoginController.$inject = ['LoginFactory', '$rootScope'];

    function LoginController(LoginFactory, $rootScope) {
    	var login = this;

    	login.error = {
    		flag: false,
    		messge: ''
    	};
    	login.user = {};
    	login.signin = signin;

    	function signin () {
    		LoginFactory.login(login.user)
    			.success(function(data) {
                    window.localStorage['user'] = JSON.stringify(data);
                    console.log(data);
    			})
    			.error(function(err){
    				login.error.flag = true;
    				login.error.message = err.message;
    			});
    	} 
        
    };
})();