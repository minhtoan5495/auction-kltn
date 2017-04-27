package hvcntt.org.shoppingweb.exception;

public class InvoiceStatusNotFoundException extends Exception {

    private static final long serialVersionUID = 1L;

    public InvoiceStatusNotFoundException() {
        super();
    }

    public InvoiceStatusNotFoundException(String message) {
        super(message);
    }

    public InvoiceStatusNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }

    public InvoiceStatusNotFoundException(Throwable cause) {
        super(cause);
    }

    protected InvoiceStatusNotFoundException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
