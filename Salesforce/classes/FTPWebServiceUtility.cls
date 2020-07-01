public class FTPWebServiceUtility {
    
    public static String FTP_WebServiceEndpoint = 'https://www.ftp-api.com/ftp/';
    
    public static FTP_Web_Service_Configuration__c oSourceFtpWebServiceConfig{
        get{
            if(oSourceFtpWebServiceConfig == null){
                return getFTPWebServiceConfiguration(false);
            }
            return oSourceFtpWebServiceConfig;  
        }
        set;
    }
    
    public static FTP_Web_Service_Configuration__c oTargetFtpWebServiceConfig{
        get{
            if(oTargetFtpWebServiceConfig == null){
                return getFTPWebServiceConfiguration(true);
            }
            return oTargetFtpWebServiceConfig;
        }
        set;
    }
    
    public static FTP_Web_Service_Configuration__c getFTPWebServiceConfiguration(Boolean isTargetEnvironment){
        FTP_Web_Service_Configuration__c oWebServiceConfiguration = new FTP_Web_Service_Configuration__c();
        String sSOQL = 'SELECT Id, Host__c, Username__c, Password__c, Port__c, Source__c';
        sSOQL += ' FROM FTP_Web_Service_Configuration__c';
        sSOQL += ' WHERE IsActive__c = true';
        if(isTargetEnvironment){
            sSOQL += ' AND IsTargetEnvironment__c = true';
        }else{
            sSOQL += ' AND IsSourceEnvironment__c = true';
        }
        for(FTP_Web_Service_Configuration__c wsc : Database.query(sSOQL)){
            oWebServiceConfiguration = wsc;
        }
        return oWebServiceConfiguration;
    }
    
    public static List<Attachment> createAttachments(List<FTPFileResponseWrapper> files, Id parentId){
        List<Attachment> lstAttachment = new List<Attachment>();
        for(FTPFileResponseWrapper oWrapper : files){
            if(oWrapper.Status == 'SUCCESS'){
                lstAttachment.add(createAttachment(oWrapper.fileName, EncodingUtil.base64Decode(oWrapper.body), parentId));
            }
        }
        return lstAttachment;
    }
    
    public static Attachment createAttachment(String fileName, Blob body, Id parentRecordId){
        Attachment oAttachment = new Attachment();
        oAttachment.Name = fileName;
        oAttachment.body = body;
        oAttachment.ParentId = parentRecordId;
        return oAttachment;
    }
    
    public static FTPResponseWrapper getFTPResponseWrapper(String status, String message, Integer code){
        FTPResponseWrapper oWrapper = new FTPResponseWrapper();
        oWrapper.Status = status;
        oWrapper.Message = message;
        oWrapper.Code = code;
        return oWrapper;
    }
    
}