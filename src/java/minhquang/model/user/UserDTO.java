/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.model.user;

/**
 *
 * @author MinhQuang
 */
public class UserDTO {
    private String id;
  private String email;
  private boolean verified_email;
  private String name;
  private String given_name;
  private String family_name;
  private String link;
  private String picture;
  private String username;
  private String password;
  private String address;
  private String phoneNo;
  private String roleID;

    public UserDTO() {
    }
   
    public UserDTO(String id,String email, String username,String password, String name, String address, String phoneNo, String roleID ) {
        
        this.id = id;
        this.email = email;
        this.name = name;
        this.address = address;
        this.password = password;
        this.username = username;
        this.phoneNo = phoneNo;
        this.roleID = roleID;
    }
    public UserDTO(String id, String email, boolean verified_email, String name, String given_name, String family_name, String link, String picture) {
        this.id = id;
        this.email = email;
        this.verified_email = verified_email;
        this.name = name;
        this.given_name = given_name;
        this.family_name = family_name;
        this.link = link;
        this.picture = picture;
    }
    
    public UserDTO(String id,String username, String name, String email, String address, String phoneNo, String roleID) {
        this.id = id;
        this.username = username;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phoneNo = phoneNo;
        this.roleID = roleID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isVerified_email() {
        return verified_email;
    }

    public void setVerified_email(boolean verified_email) {
        this.verified_email = verified_email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGiven_name() {
        return given_name;
    }

    public void setGiven_name(String given_name) {
        this.given_name = given_name;
    }

    public String getFamily_name() {
        return family_name;
    }

    public void setFamily_name(String family_name) {
        this.family_name = family_name;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    
    @Override
    public String toString() {
        return "UserDTO{" + "id=" + id + ", email=" + email + ", verified_email=" + verified_email + ", name=" + name + ", given_name=" + given_name + ", family_name=" + family_name + ", link=" + link + ", picture=" + picture + ", password=" + password + ", address=" + address + ", phoneNo=" + phoneNo + ", roleID=" + roleID + '}';
    }
    
    
    
  
}
