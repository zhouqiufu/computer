package com.DynamicNewsArea.domain;

public class DynamicNewsArea {

	private String newsId;
	private String newsTitle;
	private String newsContent;
	private String fullTime;// 年月日时分秒
	private String newsDate;// 年月日
	private String newsAuthor;// 新闻作者
	private String newsPhotographer;// 照片拍摄者
	private String newsSummary;
	private String html_path;
	private String photo_path;
	private String photo_explain;
	private String photoName;
	private String htmlName;

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

	public DynamicNewsArea() {
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

	public String getNewsId() {
		return newsId;
	}

	public void setNewsId(String newsId) {
		this.newsId = newsId;
	}

	public String getNewsTitle() {
		return newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getNewsContent() {
		return newsContent;
	}

	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
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

	public String getNewsAuthor() {
		return newsAuthor;
	}

	public void setNewsAuthor(String newsAuthor) {
		this.newsAuthor = newsAuthor;
	}

	public String getNewsPhotographer() {
		return newsPhotographer;
	}

	public void setNewsPhotographer(String newsPhotographer) {
		this.newsPhotographer = newsPhotographer;
	}

	public String getPhoto_explain() {
		return photo_explain;
	}

	public void setPhoto_explain(String photo_explain) {
		this.photo_explain = photo_explain;
	}

	public String getNewsSummary() {
		return newsSummary;
	}

	public void setNewsSummary(String newsSummary) {
		this.newsSummary = newsSummary;
	}

	public String toString() {

		return "新闻的id：	" + newsId + "\n" + //
				"新闻的标题：	" + newsTitle + "\n" + //
				"新闻的内容：	" + newsContent + "\n" + //
				"新闻发布的具体时间：	" + fullTime + "\n" + //
				"新闻发布的年月日：	" + newsDate + "\n" + //
				"新闻的作者：	" + newsAuthor + "\n" + //
				"摄影人：	" + newsPhotographer + "\n" + //
				"新闻的摘要：	" + newsSummary + "\n";//

	}

}
