({
	downloadFile : function(component, event) {
        this.startWaiting(component);
        var action = component.get("c.downloadSelectedFilesFromFtpServer");
        action.setParams({ recordId : component.get("v.recordId") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                let result = response.getReturnValue();
                component.set("v.oFTPResponseWrapper", result);
                //this.showToastMessage(component, event, 'Success', "File Download Successfully!", 'success');
            }else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        this.showToastMessage(component, event, 'Error', errors[0].message, 'error');
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    this.showToastMessage(component, event, 'Error', "Unknown error", 'error');
                    console.log("Unknown error");
                }
            }
            this.stopWaiting(component);
        });
        $A.enqueueAction(action);
	},
    
    showToastMessage : function(component, event, title, message, type) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": title,
            "message": message,
            "type":type,
            "duration":10000
        });
        toastEvent.fire();
    },
    
    startWaiting : function(component) {
        component.set("v.showSpinner", true);
    },
    
    stopWaiting : function(component){
        component.set("v.showSpinner", false);
    }
    
})