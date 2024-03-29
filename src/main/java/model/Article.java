package model;

import javax.persistence.*;

/**
 * Created by Camunda on 11/23/2015.
 */
@Entity
@Table(name = "ARTICLE")
public class Article {

    private long id;
    private String title;
    private String description;
    private String keywords;
    private String content;

    public Article(String title, String description, String keywords, String content) {
        this.title = title;
        this.description = description;
        this.keywords = keywords;
        this.content = content;
    }

    public Article() {
    }

    @Id
    @GeneratedValue
    @Column(name = "ARTICLE_ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
