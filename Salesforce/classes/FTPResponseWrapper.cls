public class FTPResponseWrapper {
    @AuraEnabled public String Status;
    @AuraEnabled public String message;
    @AuraEnabled public Integer code;
    @AuraEnabled public List<FTPFileResponseWrapper> files;
}