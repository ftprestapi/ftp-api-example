public class FTPWebServiceCompCtrl {
    
    @AuraEnabled
    public static FTPResponseWrapper uploadFileToFTPServer(Id recordId){
        try{
            return FTPWebServiceExample.uploadFiles(recordId);
        }catch(Exception ex){
            throw new AuraException(ex.getMessage());
        }
    }

    @AuraEnabled
    public static FTPResponseWrapper downloadAllFilesFromFTPServer(Id recordId){
        try{
            return FTPWebServiceExample.downloadAllFiles(recordId);
        }catch(DMLException dmlex){
            throw new AuraException(dmlex.getDMLMessage(0));
        }catch(Exception ex){
            throw new AuraException(ex.getMessage());
        }
    }

    @AuraEnabled
    public static FTPResponseWrapper downloadSelectedFilesFromFtpServer(Id recordId){
        try{
            return FTPWebServiceExample.downloadSelectedFilesOnly(recordId);
        }catch(DMLException dmlex){
            throw new AuraException(dmlex.getDMLMessage(0));
        }catch(Exception ex){
            throw new AuraException(ex.getMessage());
        }
    }

    @AuraEnabled
    public static FTPResponseWrapper transferFilesFronOneFtpServertoOtherFtpServer(){
        try{
            return FTPWebServiceExample.transferFiles();
        }catch(Exception ex){
            throw new AuraException(ex.getMessage());
        }
    }

    @AuraEnabled
    public static FTPResponseWrapper deleteFilesFromFtpServer(Id recordId){
        try{
            return FTPWebServiceExample.deleteFiles(recordId);
        }catch(Exception ex){
            throw new AuraException(ex.getMessage()+'-'+ex.getStackTraceString());
        }
    }



}