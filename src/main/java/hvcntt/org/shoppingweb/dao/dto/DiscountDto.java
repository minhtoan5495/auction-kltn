package hvcntt.org.shoppingweb.dao.dto;


import java.util.List;

public class DiscountDto {
    private String discountTitle;

    private String discountContent;

    private int discountPercent;

    private String startDate;

    private String endDate;

    private List<String> productIds;

    public DiscountDto() {
    }

    public String getDiscountTitle() {
        return discountTitle;
    }

    public void setDiscountTitle(String discountTitle) {
        this.discountTitle = discountTitle;
    }

    public String getDiscountContent() {
        return discountContent;
    }

    public void setDiscountContent(String discountContent) {
        this.discountContent = discountContent;
    }

    public int getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public List<String> getProductIds() {
        return productIds;
    }

    public void setProductIds(List<String> productIds) {
        this.productIds = productIds;
    }
}
