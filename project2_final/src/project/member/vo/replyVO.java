package project.member.vo;

import java.sql.Timestamp;

public class replyVO {
	
	private int r_num;
	private String r_id;
	private String r_content;
	private Timestamp r_reg;
	private int r_ref;
	private int r_step;
	private int r_level;
	private int br_num;
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Timestamp getR_reg() {
		return r_reg;
	}
	public void setR_reg(Timestamp r_reg) {
		this.r_reg = r_reg;
	}
	public int getR_ref() {
		return r_ref;
	}
	public void setR_ref(int r_ref) {
		this.r_ref = r_ref;
	}
	public int getR_step() {
		return r_step;
	}
	public void setR_step(int r_step) {
		this.r_step = r_step;
	}
	public int getR_level() {
		return r_level;
	}
	public void setR_level(int r_level) {
		this.r_level = r_level;
	}
	public int getBr_num() {
		return br_num;
	}
	public void setBr_num(int br_num) {
		this.br_num = br_num;
	}
	

}
