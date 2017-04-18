package hvcntt.org.shoppingweb.dao.dto;

/**
 * Created by toannguyen on 18/04/2017.
 */
public class RatingDto {

    private int rating;
    private String content;
    private String title;

    public RatingDto() {
    }

    public RatingDto(String content, String title, int rating) {
        this.rating = rating;
        this.content = content;
        this.title = title;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
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
