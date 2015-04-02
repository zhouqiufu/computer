package com.uploadphoto.domain;

public class UploadPhoto {

	private int id;
	private String photoName;
	private String photoPath;
	private String fullTime;
	private String photoExplain;

	public String getPhotoExplain() {
		return photoExplain;
	}

	public void setPhotoExplain(String photoExplain) {
		this.photoExplain = photoExplain;
	}

	public String getFullTime() {
		return fullTime;
	}

	public void setFullTime(String fullTime) {
		this.fullTime = fullTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

}
