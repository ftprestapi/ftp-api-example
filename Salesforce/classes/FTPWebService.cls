public class FTPWebService{

    //Upload Files on FTP Server
    public static HttpResponse uploadFileOnFTPServer(String endpoint, String http_method, String http_body){
        HttpRequest req = createHttpRequest(endpoint, http_method, http_body, FTPWebServiceUtility.oSourceFtpWebServiceConfig);
        Http httpreq = new Http();
        return httpreq.send(req);
    }
    
    //Reterive Files from FTP Server
    public static HttpResponse fileExportFromFTPServer(String endpoint, String http_method, String http_body, Id parentRecordId){
        HttpRequest req = createHttpRequest(endpoint, http_method, http_body, FTPWebServiceUtility.oSourceFtpWebServiceConfig);
        Http httpreq = new Http();
        return httpreq.send(req);
    }
  
    //Delete files from ftp server
    public static HttpResponse deleteFiles(String endpoint, String http_method, String http_body){
        HttpRequest req = createHttpRequest(endpoint, http_method, http_body, FTPWebServiceUtility.oSourceFtpWebServiceConfig);
        Http httpreq = new Http();
        return httpreq.send(req);
    } 

    //Transfer files from one FTP Server to Other FTP Server
    public static HttpResponse transferFiles(String endpoint, String http_method, String http_body){
        HttpRequest req = createFileTransferHttpRequest(endpoint, http_method, http_body, FTPWebServiceUtility.oSourceFtpWebServiceConfig, FTPWebServiceUtility.oTargetFtpWebServiceConfig);
        Http httpreq = new Http();
        return httpreq.send(req);
    }   

    private static HttpRequest createHttpRequest(String endpoint, String method, String body, FTP_Web_Service_Configuration__c oConfiguration){
        HttpRequest req = new HttpRequest();
        req.setHeader('ftp-host', oConfiguration.Host__c);
        req.setHeader('ftp-type', oConfiguration.Source__c);
        req.setHeader('username', oConfiguration.Username__c);
        req.setHeader('password', oConfiguration.Password__c);
        req.setHeader('port', oConfiguration.Port__c);
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(endpoint);
        req.setMethod(method);
        if(String.isNotBlank(body) && String.isNotEmpty(body)){
            req.setBody(body);
        }
        req.setTimeout(120000);
        return req;
    }

    private static HttpRequest createFileTransferHttpRequest(String endpoint, String method, String body, FTP_Web_Service_Configuration__c oSourceConfiguration, FTP_Web_Service_Configuration__c oTargetConfiguration){
        HttpRequest req = new HttpRequest();
        req.setHeader('source-ftp-type', oSourceConfiguration.Source__c);
        req.setHeader('source-ftp-host', oSourceConfiguration.Host__c);
        req.setHeader('source-username', oSourceConfiguration.Username__c);
        req.setHeader('source-password', oSourceConfiguration.Password__c);
        req.setHeader('source-port', oSourceConfiguration.Port__c);
        req.setHeader('target-ftp-host', oTargetConfiguration.Host__c);
        req.setHeader('target-username', oTargetConfiguration.Username__c);
        req.setHeader('target-password', oTargetConfiguration.Password__c);
        req.setHeader('target-port', oTargetConfiguration.Port__c);
        req.setHeader('target-ftp-type', oTargetConfiguration.Source__c);
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(endpoint); 
        req.setMethod(method);
        if(String.isNotBlank(body) && String.isNotEmpty(body)){
            req.setBody(body);
        }
        req.setTimeout(120000);
        return req;
    }
    
}