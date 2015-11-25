package model;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by Camunda on 11/23/2015.
 */

@Entity
@Table(name = "CATEGORY")
public class Category {

    private long id;
    private String name;

    private Set<Article> articles;

    public Category() {
    }

    public Category(String name) {
        this.name = name;
    }

    @Id
    @GeneratedValue
    @Column(name = "CATEGORY_ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    @OneToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "CATEGORY_ARTICLE"
            , joinColumns = @JoinColumn(name = "CATEGORY_ID")
            , inverseJoinColumns = @JoinColumn(name = "ARTICLE_ID")
    )
    public Set<Article> getArticles() {
        return articles;
    }

    public void setArticles(Set<Article> articles) {
        this.articles = articles;
    }
}
