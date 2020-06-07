public class FTPResponseWrapper {
    @AuraEnabled public String Status;
    @AuraEnabled public String Message;
    @AuraEnabled public Integer Code;
    @AuraEnabled public List<FTPFileResponseWrapper> Files;
}