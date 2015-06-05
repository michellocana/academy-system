package lib;

public interface IFileDownloadHandler {

	public void onFinishSendFile(String fileName);
	public void onFinishReceiveFile(String fileName);
	public void onErrorSendFile(Exception e);
	public void onErrorReceiveFile(Exception e);
}
