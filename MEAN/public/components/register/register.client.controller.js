(function () {
    angular
        .module('retailApp')
        .controller('RegisterController', RegisterController);

    RegisterController.$inject = ['RegisterFactory'];

    function RegisterController(RegisterFactory) {
    	var register = this;

        register.error = {
            flag: false,
            message: ''
        };
    	register.user = {};
        register.createUser = createUser;

    	function createUser () {
    		RegisterFactory.register(register.user)
    			.success(function (data) {
                    console.log(data);
    			})
                .error(function (err) {
                    register.error.flag = true;
                    register.error.message = error.message;
                });
        } 
        
    };
})();