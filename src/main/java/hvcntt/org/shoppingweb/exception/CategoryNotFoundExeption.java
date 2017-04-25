package hvcntt.org.shoppingweb.exception;

public class CategoryNotFoundExeption extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public CategoryNotFoundExeption() {
        super();
    }

    public CategoryNotFoundExeption(String message) {
        super(message);
    }

    public CategoryNotFoundExeption(String message, Throwable cause) {
        super(message, cause);
    }

    public CategoryNotFoundExeption(Throwable cause) {
        super(cause);
    }

    protected CategoryNotFoundExeption(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

}
