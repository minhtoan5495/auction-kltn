package hvcntt.org.shoppingweb.dao.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "token_to_verify_email")
public class TokenToVerifyEmail implements Serializable {

    private static final long serialVersionUID = 3012803977955439996L;

    private static final Integer EXPIRATION = 60 * 24;

    @Id
    @Column(name = "token_id")
    private String tokenId;

    @OneToOne(targetEntity = User.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "username", nullable = false)
    private User user;

    @Column(name = "token")
    private String token;

    @Column(name = "expiry_date")
    private Date expiryDate;

    public TokenToVerifyEmail() {
    }

    public TokenToVerifyEmail(User user, String token) {
        this.setTokenId(UUID.randomUUID().toString());
        this.user = user;
        this.token = token;
        this.expiryDate = calculateExpiryDate(EXPIRATION);
    }

    private Date calculateExpiryDate(int expiration) {
        final Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(new Date().getTime());
        calendar.add(Calendar.MINUTE, expiration);
        return new Date(calendar.getTime().getTime());
    }

    public void updateToken(final String token) {
        this.token = token;
        this.expiryDate = calculateExpiryDate(EXPIRATION);
    }

    public User getUser() {
        return user;
    }

    public String getToken() {
        return token;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public String getTokenId() {
        return tokenId;
    }

    public void setTokenId(String tokenId) {
        this.tokenId = tokenId;
    }

    @Override
    public String toString() {
        return "PasswordResetToken{" +
                "user=" + user +
                ", token='" + token + '\'' +
                ", expiryDate=" + expiryDate +
                '}';
    }
}
