package hvcntt.org.shoppingweb.exception;

public class InvoiceException extends RuntimeException {

    private static final long serialVersionUID = -84653449263019960L;

    private String message;
    private String code;

    public InvoiceException(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
