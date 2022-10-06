({ 
    invokeAPI: function(component, params) {

        if(params && params.recordId){
            
			//assuming you set some record id in parameters
            const urlEndpoint = params.endpointURL + '?recordId=' + params.recordId;
			
            fetch(urlEndpoint)
            .then(response => {
                if(response.status === 200) {
                    return response.json();
                } else {
                    console.log('Response status is not good', response);
                    if(params.errorCallback) params.errorCallback('Error. Response status ' + response.status);
                }
            })
            .then(response => {
                console.log('response',  response);
                if(response.status) {
					if(params.successCallback) params.successCallback();
                }
            })
            .catch(error => {
                console.log('error',  error);
                if(params.errorCallback) params.errorCallback(error.message);
            });
        }
        else{
            params.successCallback();
        }
    }
})