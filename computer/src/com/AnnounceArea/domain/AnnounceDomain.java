package com.AnnounceArea.domain;

public class AnnounceDomain {

	private String announceId;
	private String announceTitle;
	private String announceContent;
	private String fullTime;// 年月日时分秒
	private String newsDate;// 年月日
	private String announceAuthor;
	private String html_path;
	private String photo_path;
	private String photo_explain;
	private String photoName;
	private String htmlName;

	public String getAnnounceId() {
		return announceId;
	}

	public void setAnnounceId(String announceId) {
		this.announceId = announceId;
	}

	public String getAnnounceTitle() {
		return announceTitle;
	}

	public void setAnnounceTitle(String announceTitle) {
		this.announceTitle = announceTitle;
	}

	public String getAnnounceContent() {
		return announceContent;
	}

	public void setAnnounceContent(String announceContent) {
		this.announceContent = announceContent;
	}

	public String getFullTime() {
		return fullTime;
	}

	public void setFullTime(String fullTime) {
		this.fullTime = fullTime;
	}

	public String getNewsDate() {
		return newsDate;
	}

	public void setNewsDate(String newsDate) {
		this.newsDate = newsDate;
	}

	public String getAnnounceAuthor() {
		return announceAuthor;
	}

	public void setAnnounceAuthor(String announceAuthor) {
		this.announceAuthor = announceAuthor;
	}

	public String getHtml_path() {
		return html_path;
	}

	public void setHtml_path(String html_path) {
		this.html_path = html_path;
	}

	public String getPhoto_path() {
		return photo_path;
	}

	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}

	public String getPhoto_explain() {
		return photo_explain;
	}

	public void setPhoto_explain(String photo_explain) {
		this.photo_explain = photo_explain;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getHtmlName() {
		return htmlName;
	}

	public void setHtmlName(String htmlName) {
		this.htmlName = htmlName;
	}

}
