(function () {
    angular
        .module('retailApp')
        .controller('LoginController', LoginController);

    LoginController.$inject = ['LoginFactory'];

    function LoginController(LoginFactory) {
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
    			})
    			.error(function(err){
    				login.error.flag = true;
    				login.error.message = err.message;
    			});
    	} 
        
    };
})();