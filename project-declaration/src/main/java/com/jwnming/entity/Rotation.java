package com.jwnming.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;

public class Rotation implements Serializable {
	private Integer id;
	private String title;
	@JSONField(name="file")  //填充到表格中需要的路径
	private String imagePath;
	@JSONField(format="yyyy-MM-dd")
	private Date uploadDate;
	private String description;
	private Integer status;
	private Integer proportion;
	public Rotation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Rotation(Integer id, String title, String imagePath, Date uploadDate, String description, Integer status,
			Integer proportion) {
		super();
		this.id = id;
		this.title = title;
		this.imagePath = imagePath;
		this.uploadDate = uploadDate;
		this.description = description;
		this.status = status;
		this.proportion = proportion;
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
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getProportion() {
		return proportion;
	}
	public void setProportion(Integer proportion) {
		this.proportion = proportion;
	}
	@Override
	public String toString() {
		return "Rotation [id=" + id + ", title=" + title + ", imagePath=" + imagePath + ", uploadDate=" + uploadDate
				+ ", description=" + description + ", status=" + status + ", proportion=" + proportion + "]";
	}
	
}
