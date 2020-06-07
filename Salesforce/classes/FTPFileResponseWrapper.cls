public class FTPFileResponseWrapper {
	@AuraEnabled public String FileName;
    @AuraEnabled public String Path;
    @AuraEnabled public String body;
    @AuraEnabled public Long LastModifiedDateTime;
    @AuraEnabled public String Status;
    @AuraEnabled public String Message;
    @AuraEnabled public String Code;
}