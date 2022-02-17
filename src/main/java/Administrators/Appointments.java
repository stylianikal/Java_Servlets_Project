package Administrators;

import Utils.Connect_Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Appointments  {
    private int appid;
    int id;
    int doct_id;
     String description;
     String date;

    public Appointments() {


    }
    public Appointments(int appid, int id, int doct_id, String description,String date){
        this.appid=appid;
        this.id=id;
        this.doct_id=doct_id;
        this.description=description;
        this.date=date;
    }
    //  Get/Set for Id
    public int getId(String id) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT id appid " +
                    "FROM users appointments " +
                    "WHERE id=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                appid = rs.getInt("appid");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            return appid = 0;
        }
        return appid;
    }
    //  Get/Set for
    public String getUsername(String username) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT appid " +
                    "FROM appointments " +
                    "WHERE appid=?");
            pst.setString(1, username);
            rs = pst.executeQuery();
            if (rs.next()) {
                appid = rs.getInt("username");
            }
        }
        catch (Exception e) {
            System.out.println("Something went wrong!");
            e.printStackTrace();
            return null;
        }
        return username;
    }
    //  Get/Set for doctor name
    public String getDoct_name(String doct_id) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT doct_id " +
                    "FROM appointments " +
                    "WHERE doct_id=?");
            pst.setString(1, doct_id);
            rs = pst.executeQuery();
            if (rs.next()) {
                doct_id = rs.getString("doct_name");
            }
        }
        catch (Exception e) {
            System.out.println("Something went wrong!");
            e.printStackTrace();
            return null;
        }
        return doct_id;
    }
    //  Get/Set for Description
    public String Description(String username) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT description " +
                    "FROM appointments " +
                    "WHERE appid=?");
            pst.setString(1, username);
            rs = pst.executeQuery();
            if (rs.next()) {
                description = rs.getString("description");
            }
        }
        catch (Exception e) {
            System.out.println("Something went wrong!");
            e.printStackTrace();
            return null;
        }
        return description;
    }
    //  GetSet for date
    public String getDate(String username) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT date() " +
                    "FROM appointments " +
                    "WHERE date=?");
            pst.setString(1, username);
            rs = pst.executeQuery();
            if (rs.next()) {
                date= rs.getString("date");
            }
        }
        catch (Exception e) {
            System.out.println("Something went wrong!");
            e.printStackTrace();
            return null;
        }
        return date;
    }
}
