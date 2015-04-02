package com.maintain.domain;

public class Maintain {

	private int id;
	// 姓名
	private String name;
	// 手机号码
	private String phone;
	// 寝室号
	private String address;
	// 空闲时间
	private String freetime;
	// 维护类型
	private String weihu;
	// 设备类型
	private String shebei;
	// 软件平台
	private String pingtai;
	// 故障现象
	private String guzhang;
	// 故障详细描述
	private String content;

	// 日期
	private String dateTime;

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFreetime() {
		return freetime;
	}

	public void setFreetime(String freetime) {
		this.freetime = freetime;
	}

	public String getWeihu() {
		return weihu;
	}

	public void setWeihu(String weihu) {
		this.weihu = weihu;
	}

	public String getShebei() {
		return shebei;
	}

	public void setShebei(String shebei) {
		this.shebei = shebei;
	}

	public String getPingtai() {
		return pingtai;
	}

	public void setPingtai(String pingtai) {
		this.pingtai = pingtai;
	}

	public String getGuzhang() {
		return guzhang;
	}

	public void setGuzhang(String guzhang) {
		this.guzhang = guzhang;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
