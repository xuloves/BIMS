package com.shixin.entity;

/**
 * @author 今何许
 * @date 2020/5/20 11:01
 */
public class Book {
    private Integer id;
    private String name;
    private String author;
    private String publicer;
    private Integer inventory;
    private Integer count;

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", publicer='" + publicer + '\'' +
                ", inventory=" + inventory +
                ", count=" + count +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublicer() {
        return publicer;
    }

    public void setPublicer(String publicer) {
        this.publicer = publicer;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
