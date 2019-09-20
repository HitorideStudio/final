package project.member.vo;

import java.sql.Timestamp;

public class memberBoardVO {
	private int b_num;
	private String b_id;
	private String b_img;
	private String b_content;
	private Timestamp b_reg;
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public String getB_img() {
		return b_img;
	}
	public void setB_img(String b_img) {
		this.b_img = b_img;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Timestamp getB_reg() {
		return b_reg;
	}
	public void setB_reg(Timestamp b_reg) {
		this.b_reg = b_reg;
	}
	
	
	

}
