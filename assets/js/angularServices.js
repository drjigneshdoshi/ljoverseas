// <reference path="angular.js">

app
.factory('httpAuthService',function($http,Base64,DataLoader,$cookies,$log){
	return{
		sendRequest: function(method,requestUrl,successCallback,errorCallback,parameters){
			var today = new Date();
			var expired = new Date(today);
			// $cookies.remove('myFavorite');
			expired.setDate(today.getDate() + 1); //Set expired date to tomorrow
			$cookies.put('user', Base64.encode('hetkansara@gmail.com:1234'), {expires : expired });
			var user = $cookies.get('user');
			$log.info(user);
			$log.info(Base64.decode(user));
			DataLoader.getAuth( user, requestUrl , method, parameters).then(successCallback,errorCallback);
		}
	};
})
.factory('httpService',function($http){
	return{
		sendRequest: function(method,successCallback,errorCallback,parameters){
			$http({
				method: method,
				// url: "http://www.ljinnovationvillage.org/request_handler.php",
				url: "http://localhost/LJ%20Innovation%20Village/request_handler.php",
				params: parameters})
				.then(successCallback,errorCallback);
		}
	};
})
.factory('authenticationService',function($rootScope,myCookieService,$location){
    return{
        authAtAdminRoute: function(){
            var cookieData = myCookieService.getCookie();
            if(cookieData==undefined){
                $location.path('/Home');
                $rootScope.path="Templates/links.html";
            }
            else if(cookieData.user_type=="Student"){
                $location.path('/Student');
                $rootScope.path="Templates/Student/links.html";
            }
            else if(cookieData.user_type=="Mentor"){
                $location.path('/Mentor');
                $rootScope.path="Templates/Mentor/links.html";
            }
            else{
                $rootScope.button = {name: "Logout",path: "#/Home"};
                $rootScope.path="Templates/Admin/links.html";
           }
        },
        authAtHomeRoute: function(){
            var cookieData = myCookieService.getCookie();
            if(cookieData==undefined){
            }else if(cookieData.user_type=="Admin"){
                $location.path('/Admin/Home');
                $rootScope.button = {name: "Logout",path: "#/Home"};
                $rootScope.path="Templates/Admin/links.html";                 
            }else if(cookieData.user_type=="Student"){
                $location.path('/Student/Home');
                $rootScope.button = {name: "Logout",path: "#/Student"};
                $rootScope.path="Templates/Student/links.html";                 
            }
            else if(cookieData.user_type=="Mentor"){
                $location.path('/Mentor');
                $rootScope.button = {name: "Mentor",path: "#/Mentor"};
                $rootScope.path="Templates/Mentor/links.html";
            }
            else{
                $rootScope.path="Templates/links.html";
            }
        },
        authAtStudentRoute: function(){
            var cookieData = myCookieService.getCookie();
            if(cookieData==undefined){
                $location.path('/Home');
                $rootScope.path="Templates/links.html";
            }
            else if(cookieData.user_type=="Admin"){
                $location.path('/Admin');
                $rootScope.path="Templates/Admin/links.html";
            }
            else if(cookieData.user_type=="Mentor"){
                $location.path('/Mentor');
                $rootScope.path="Templates/Mentor/links.html";
            }
            else{
                $rootScope.button = {name: "Logout",path: "#/Home"};
                $rootScope.path="Templates/Student/links.html";
           }
        },
        authAtMentorRoute: function(){
            var cookieData = myCookieService.getCookie();
            if(cookieData==undefined){
                $location.path('/Home');
                $rootScope.path="Templates/links.html";
            }
            else if(cookieData.user_type=="Admin"){
                $location.path('/Admin');
                $rootScope.path="Templates/Admin/links.html";
            }
            else if(cookieData.user_type=="Student"){
                $location.path('/Student');
                $rootScope.path="Templates/Student/links.html";
            }
            else{
                $rootScope.button = {name: "Logout",path: "#/Home"};
                $rootScope.path="Templates/Mentor/links.html";
           }
        }
    };
})
.factory('myCookieService',function($http,$cookies){
    return{
        getCookie: function(){
           var credentials = $cookies.get('credentials');
           if( angular.equals(credentials,undefined)){
                return undefined;
           }
           else{
               var return_data = {
                    user_type:$cookies.get('user_type'),
                    credentials: $cookies.get('credentials'),
                    email: $cookies.get('email'),
                    first_name: $cookies.get('first_name'),
                    last_name: $cookies.get('last_name')
               }
               return return_data;
           }
        },
        setCookie: function(params){
           $cookies.put('user_type', params.user_type);
           $cookies.put('credentials', params.credentials);
           $cookies.put('email', params.email);
           $cookies.put('first_name', params.first_name);
           $cookies.put('last_name', params.last_name);
        },
        clearCookie: function(){
            var user =$cookies.get('user_type');
            if(!angular.equals(user,undefined)){
                $cookies.remove('credentials');
                $cookies.remove('user_type');
                $cookies.remove('email');
                $cookies.remove('first_name');
                $cookies.remove('last_name');
            }
        }
    };
});






