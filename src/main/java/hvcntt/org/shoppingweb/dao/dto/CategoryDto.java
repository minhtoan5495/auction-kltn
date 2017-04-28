package hvcntt.org.shoppingweb.dao.dto;

import java.io.Serializable;

public class CategoryDto implements Serializable {

    private static final long serialVersionUID = -7208585111105245489L;

    private String categoryId;

    private String categoryName;

    private String parentId;

    public CategoryDto() {
    }

    public CategoryDto(String categoryName, String parentId) {
        this.categoryName = categoryName;
        this.parentId = parentId;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return this.categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
}