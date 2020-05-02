public class FileTransferWrapper {
    public String source_file_Name;
    public String source_path;
    public String target_file_Name;
    public String target_path;

    public FileTransferWrapper(String sourcefileName, String sourcepath, String targetfileName, String targetpath){
        this.source_file_Name = sourcefileName;
        this.source_path = sourcepath;
        this.target_file_Name = targetfileName;
        this.target_path = targetpath;
    }

}