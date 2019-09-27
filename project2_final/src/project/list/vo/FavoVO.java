package project.list.vo;

import java.util.Date;

public class FavoVO {
   private int favo_id;
   private String info_id;
   private String member_id;
   private Date date;
   private String placename;
   
 
   public String getPlacename() {
	   return placename;
   }
   public void setPlacename(String placename) {
	   this.placename = placename;
   }
   public int getFavo_id() {
      return favo_id;
   }
   public void setFavo_id(int favo_id) {
      this.favo_id = favo_id;
   }
   public String getInfo_id() {
      return info_id;
   }
   public void setInfo_id(String info_id) {
      this.info_id = info_id;
   }
   public String getMember_id() {
      return member_id;
   }
   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }
   public Date getDate() {
      return date;
   }
   public void setDate(Date date) {
      this.date = date;
   }
   
   
}