public class FTPWebServiceExample {
    
    public static FTPResponseWrapper uploadFiles(Id parentId){
        List<FileWrapper> lstFileWrapper = new List<FileWrapper>();
        for(Attachment oAttachment : [SELECT Id, body, Name FROM Attachment Where ParentId=:parentId]){
            lstFileWrapper.add(new FileWrapper(oAttachment.Name, '/tmp', EncodingUtil.base64Encode(oAttachment.body)));
        }
        String endpoint = FTPWebServiceUtility.FTP_WebServiceEndpoint+'upload'; 
        HttpResponse response = FTPWebService.uploadFileOnFTPServer(endpoint, 'POST', JSON.serialize(lstFileWrapper));
        if(response != null){
            if(response.getStatusCode() == 200){
                return (FTPResponseWrapper)JSON.deserialize(response.getBody(), FTPResponseWrapper.class);
            }else if(response.getStatusCode() == 400){
            	return (FTPResponseWrapper)JSON.deserialize(response.getBody(), FTPResponseWrapper.class);
            }else{
                return FTPWebServiceUtility.getFTPResponseWrapper('ERROR', 'Callout Failed!', response.getStatusCode());
            }
        }else{
            return FTPWebServiceUtility.getFTPResponseWrapper('ERROR', 'Callout Failed!', 0);
        }
    }
    
    public static FTPResponseWrapper downloadAllFiles(Id parentId){
        String endpoint = FTPWebServiceUtility.FTP_WebServiceEndpoint+'download';
        HttpResponse response = FTPWebService.fileExportFromFTPServer(endpoint, 'GET', null, parentId);
        if(response != null){
            system.debug('==response=='+response.getBody());
            if(response.getStatusCode() == 200){
                FTPResponseWrapper oFTPResponseWrapper = (FTPResponseWrapper)JSON.deserialize(response.getBody(), FTPResponseWrapper.class);
                List<Attachment> lstAttachment = FTPWebServiceUtility.createAttachments(oFTPResponseWrapper.Files, parentId);
                if(lstAttachment.size()>0){ insert lstAttachment;}
                return oFTPResponseWrapper;
            }else if(response.getStatusCode() == 400){
            	return (FTPResponseWrapper)JSON.deserialize(response.getBody(), FTPResponseWrapper.class);
            }else{
                return FTPWebServiceUtility.getFTPResponseWrapper('ERROR', 'Callout Failed!', response.getStatusCode());
            }
        }else{
            return FTPWebServiceUtility.getFTPResponseWrapper('ERROR', 'Callout Failed!', 0);
        }
    }
    
    public static FTPResponseWrapper downloadSelectedFilesOnly(Id parentId){
        List<FileWrapper> lstFileWrapper = new List<FileWrapper>();
        //lstFileWrapper.add(new FileWrapper(File Name, Path, ''));
        lstFileWrapper.add(new FileWrapper('Test.csv','/tmp', null));
        lstFileWrapper.add(new FileWrapper('Test.xml','/tmp', null)); 
        lstFileWrapper.add(new FileWrapper('Test.xlsx','/tmp', null));
        lstFileWrapper.add(new FileWrapper('Test.pdf','/tmp', null));
        lstFileWrapper.add(new FileWrapper('Test.jpg','/tmp', null));
        
        String endpoint = FTPWebServiceUtility.FTP_WebServiceEndpoint+'download';
        HttpResponse response = FTPWebService.fileExportFromFTPServer(endpoint, 'POST', JSON.serialize(lstFileWrapper), parentId);
        if(response != null){
            if(response.getStatusCode() == 200){
                FTPResponseWrapper oFTPResponseWrapper = (FTPResponseWrapper)JSON.deserialize(response.getBody(), FTPResponseWrapper.class);
                List<Attachment> lstAttachment = FTPWebServiceUtility.createAttachments(oFTPResponseWrapper.Files, parentId);
                if(lstAttachment.size()>0){ insert lstAttachment;}
                return oFTPResponseWrapper;
            }else if(response.getStatusCode() == 400){
            	return (FTPResponseWrapper)JSON.deserialize(response.getBody(), FTPResponseWrapper.class);
            }else{
                return FTPWebServiceUtility.getFTPResponseWrapper('ERROR', 'Callout Failed!', response.getStatusCode());
            }
        }else{
            return FTPWebServiceUtility.getFTPResponseWrapper('ERROR', 'Callout Failed!', 0);
        }
    }
    
    public static FTPResponseWrapper transferFiles(){
        List<FileTransferWrapper> lstFileTransferWrapper = new List<FileTransferWrapper>();
        //lstFileTransferWrapper.add(new FileWrapper(Source File Name, Source Path, Target File Name, Target Path));
        lstFileTransferWrapper.add(new FileTransferWrapper('Test.csv','/tmp', 'attachmentTest.csv', '/temp1'));
        lstFileTransferWrapper.add(new FileTransferWrapper('Test.xml','/tmp','Test.xml', '/temp1'));
        lstFileTransferWrapper.add(new FileTransferWrapper('Test.xlsx','/tmp','Test.xlsx', '/temp1'));
        lstFileTransferWrapper.add(new FileTransferWrapper('Test.pdf','/tmp', 'Test.pdf', '/temp1'));
        lstFileTransferWrapper.add(new FileTransferWrapper('Test.jpg','/tmp', 'Test.jpg', '/temp1'));
        
        String endpoint = FTPWebServiceUtility.FTP_WebServiceEndpoint+'transfer'; 
        HttpResponse response = FTPWebService.transferFiles(endpoint, 'POST', JSON.serialize(lstFileTransferWrapper));
        if(response != null){
            if(response.getStatusCode() == 200){
                return (FTPResponseWrapper)JSON.deserialize(response.getBody(), FTPResponseWrapper.class);
            }else if(response.getStatusCode() == 400){
            	return (FTPResponseWrapper)JSON.deserialize(response.getBody(), FTPResponseWrapper.class);
            }else{
                return FTPWebServiceUtility.getFTPResponseWrapper('ERROR', 'Callout Failed!', response.getStatusCode());
            }
        }else{
            return FTPWebServiceUtility.getFTPResponseWrapper('ERROR', 'Callout Failed!', 0);
        }
    }
    
    public static FTPResponseWrapper deleteFiles(Id ParentId){
        List<FileWrapper> lstFileWrapper = new List<FileWrapper>();
        for(Attachment oAttachment : [SELECT Id, Name FROM Attachment Where ParentId=:parentId]){
            lstFileWrapper.add(new FileWrapper(oAttachment.Name, '/tmp', null)); 
        }
        String endpoint = FTPWebServiceUtility.FTP_WebServiceEndpoint+'delete';
        HttpResponse response = FTPWebService.deleteFiles(endpoint, 'DELETE', JSON.serialize(lstFileWrapper));
        if(response != null){
            if(response.getStatusCode() == 200){
            	return (FTPResponseWrapper)JSON.deserialize(response.getBody(), FTPResponseWrapper.class);    
            }else if(response.getStatusCode() == 400){
            	return (FTPResponseWrapper)JSON.deserialize(response.getBody(), FTPResponseWrapper.class);
            }else{
                return FTPWebServiceUtility.getFTPResponseWrapper('ERROR', 'Callout Failed!', response.getStatusCode());
            }
        }else{
            return FTPWebServiceUtility.getFTPResponseWrapper('ERROR', 'Callout Failed!', 0);
        }
    }
    
}