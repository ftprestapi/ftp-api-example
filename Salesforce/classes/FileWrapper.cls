public class FileWrapper {
	public String fileName{get;set;}
	public String path{get;set;}
	public String body{get;set;}
	
	public FileWrapper(String fName, String directory, String strBody){
		this.fileName = fName;
		this.path = directory;
		this.body = strBody;
	}
}