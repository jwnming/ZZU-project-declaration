package com.jwnming.entity;

import java.io.Serializable;
import java.util.List;

public class Menu implements Serializable {
	private Integer id;
	private String title;
	private String icon;
	private String href;
	private List<Menu> children;
	public Menu() {
		super();
	}
	public Menu(Integer id, String title, String icon, String href, List<Menu> children) {
		super();
		this.id = id;
		this.title = title;
		this.icon = icon;
		this.href = href;
		this.children = children;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public List<Menu> getChildren() {
		return children;
	}
	public void setChildren(List<Menu> children) {
		this.children = children;
	}
	@Override
	public String toString() {
		return "Menu [id=" + id + ", title=" + title + ", icon=" + icon + ", href=" + href + ", children=" + children
				+ "]";
	}
	
	
}
