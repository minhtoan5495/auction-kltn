package hvcntt.org.shoppingweb.dao.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.UUID;

/**
 * Created by toannguyen on 28/04/2017.
 */
@Entity
@Table(name="parent")
@NamedQuery(name="Parent.findAll", query="SELECT p FROM Parent p")
public class Parent implements Serializable {

    private static final long serialVersionUID = 8095514962234024251L;
    @Id
    @Column(name="parent_id")
    private String parentId;

    @Column(name="parent_name")
    private String parentName;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "parent", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Category> categories;

    public Parent() {
        setParentId(UUID.randomUUID().toString());
    }

    public Parent(String parentId, String parentName) {
        this.parentId = parentId;
        this.parentName = parentName;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }
}
