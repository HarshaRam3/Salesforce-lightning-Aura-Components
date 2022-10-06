({
    someFunction: function(component, event, helper) {
		
		const externalId = component.get('recordId');
		const endpoint = 'https://someserviceurl.com';
		const apiService = component.find('APIServiceComponent');
		apiService.invokeAPI(
			endpoint, externalId,
		$A.getCallback(() => {
			
			//handle the success response
		}),
		$A.getCallback((error) => {
			this.showToastMessage(component, "error", "Error", error);
			//handle the error response
		}));
	}
})