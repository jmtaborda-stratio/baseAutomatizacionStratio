
package schemas;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

public class UserFormacion {

    @SerializedName("userId")
    @Expose
    private Integer userId;
    @SerializedName("id")
    @Expose
    private Integer id;
    @SerializedName("title")
    @Expose
    private String title;
    @SerializedName("body")
    @Expose
    private String body;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public UserFormacion withUserId(Integer userId) {
        this.userId = userId;
        return this;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public UserFormacion withId(Integer id) {
        this.id = id;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public UserFormacion withTitle(String title) {
        this.title = title;
        return this;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public UserFormacion withBody(String body) {
        this.body = body;
        return this;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this).append("userId", userId).append("id", id).append("title", title).append("body", body).toString();
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder().append(id).append(title).append(body).append(userId).toHashCode();
    }

    @Override
    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if ((other instanceof UserFormacion) == false) {
            return false;
        }
        UserFormacion rhs = ((UserFormacion) other);
        return new EqualsBuilder().append(id, rhs.id).append(title, rhs.title).append(body, rhs.body).append(userId, rhs.userId).isEquals();
    }

}
