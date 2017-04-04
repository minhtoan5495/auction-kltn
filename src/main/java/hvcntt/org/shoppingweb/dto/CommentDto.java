package hvcntt.org.shoppingweb.dto;

public class CommentDto {
	private String content;
	private String title;

	public CommentDto() {
	}

	public CommentDto(String content, String title) {
		this.content = content;
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
