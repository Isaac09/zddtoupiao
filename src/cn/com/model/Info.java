package cn.com.model;

import java.sql.Timestamp;

public class Info {
	private int info_id;
	private String info_title;
	private String info_content;
	private Timestamp info_date;
	private int info_type;
	private int info_status;
	private int info_danshuang;
	private int info_num;
	private int info_pnum;
	private int xuanxiang_id;
	private int xuangxiang_info_id;
	private String xuanxiang_content;
	private int xuanxiang_num;
	private int xuanxiang_pnum;
	private int xuanxiang_maxnum;
	
	public int getXuanxiang_maxnum() {
		return xuanxiang_maxnum;
	}
	public void setXuanxiang_maxnum(int xuanxiang_maxnum) {
		this.xuanxiang_maxnum = xuanxiang_maxnum;
	}
	public int getInfo_id() {
		return info_id;
	}
	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}
	public String getInfo_title() {
		return info_title;
	}
	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}
	public String getInfo_content() {
		return info_content;
	}
	public void setInfo_content(String info_content) {
		this.info_content = info_content;
	}
	public Timestamp getInfo_date() {
		return info_date;
	}
	public void setInfo_date(Timestamp info_date) {
		this.info_date = info_date;
	}
	public int getInfo_type() {
		return info_type;
	}
	public void setInfo_type(int info_type) {
		this.info_type = info_type;
	}
	public int getInfo_status() {
		return info_status;
	}
	public void setInfo_status(int info_status) {
		this.info_status = info_status;
	}
	public int getInfo_danshuang() {
		return info_danshuang;
	}
	public void setInfo_danshuang(int info_danshuang) {
		this.info_danshuang = info_danshuang;
	}
	public int getXuanxiang_id() {
		return xuanxiang_id;
	}
	public int getInfo_num() {
		return info_num;
	}
	public void setInfo_num(int info_num) {
		this.info_num = info_num;
	}
	public int getInfo_pnum() {
		return info_pnum;
	}
	public void setInfo_pnum(int info_pnum) {
		this.info_pnum = info_pnum;
	}
	public void setXuanxiang_id(int xuanxiang_id) {
		this.xuanxiang_id = xuanxiang_id;
	}
	public int getXuangxiang_info_id() {
		return xuangxiang_info_id;
	}
	public void setXuangxiang_info_id(int xuangxiang_info_id) {
		this.xuangxiang_info_id = xuangxiang_info_id;
	}
	public String getXuanxiang_content() {
		return xuanxiang_content;
	}
	public void setXuanxiang_content(String xuanxiang_content) {
		this.xuanxiang_content = xuanxiang_content;
	}
	public int getXuanxiang_num() {
		return xuanxiang_num;
	}
	public void setXuanxiang_num(int xuanxiang_num) {
		this.xuanxiang_num = xuanxiang_num;
	}
	public int getXuanxiang_pnum() {
		return xuanxiang_pnum;
	}
	public void setXuanxiang_pnum(int xuanxiang_pnum) {
		this.xuanxiang_pnum = xuanxiang_pnum;
	}

}
