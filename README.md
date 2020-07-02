# [FTP API](https://www.ftp-api.com/)

In this tutorial, we will see how we can directly communicate with FTP / SFTP server using REST API. It solve's problem like using FTP / SFTP server from salesforce or other platforms using http callouts.

## Introduction

FTP API is designed for people who need to perform actions like DOWNLOAD, UPLOAD, DELETE and TRANSFER on the FTP / SFTP server using REST API's. In these API's lets you control nearly all aspects of your FTP / SFTP server operations programatically. These API's are based on GET, POST and DELETE operations.

### How to Use FTP API's

* UPLOAD: 

This API allow us to upload files on FTP / SFTP Server. User can upload single or multiple files in a single API call. File object contains three parameters : path , filename and body. Body should be provided in Base64 encoding.

```
HTTP Request
POST https://www.ftp-api.com/ftp/upload
```

![alt text](https://github.com/ftprestapi/ftp-api-example/raw/master/images/upload.png "Upload")

* DELETE:

This API allow to delete files on FTP / SFTP server. Specify the files to be deleted, by passing file-name and it's path on FTP / SFTP server.

```
HTTP Request
DELETE https://www.ftp-api.com/ftp/delete
```

![alt text](https://github.com/ftprestapi/ftp-api-example/raw/master/images/delete.png "Delete")

* DOWNLOAD:

This API allow to download files from the FTP / SFTP server. This is a GET API. This operation can be performed in two ways, depending on the number of files you needed.

First, the user can get all the files from the FTP / SFTP server. 

Second, the user can specify the files which are needed, so the API will return only the specified files. This API is further enhanced based on single or multiple files.

```
HTTP Request
GET https://www.ftp-api.com/ftp/download
```

![alt text](https://github.com/ftprestapi/ftp-api-example/raw/master/images/download.png "Download")

* TRANSFER:

This API allows user to transfer multiple files from one FTP / SFTP server to another FTP / SFTP server without downloading files.

Note: This API requires both source and destination FTP / SFTP server authentication.

```
HTTP Request
POST https://www.ftp-api.com/ftp/transfer
```

![alt text](https://github.com/ftprestapi/ftp-api-example/raw/master/images/transfer.png "Transfer")


And if you enjoyed this post, share it.

