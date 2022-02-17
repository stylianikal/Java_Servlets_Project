package Administrators;

import Utils.Connect_Database;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
public class Admins {
    public Admins() {
    }
    public boolean createUser(String full_name, String username, String password , String telephone, String role, String email) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();

        if (telephone == "" || telephone == null) {
            try {
                pst = conn.prepareStatement("SELECT setval('users_id_seq', max(id)) " +
                        "FROM users;");
                pst.executeQuery();
                pst = conn.prepareStatement("INSERT INTO users(full_name, username, password, telephone, role, email) VALUES ('"+full_name+"', '"+username+"', '"+password+"','"+telephone+"','"+role+"','"+email+"')");
                int i = pst.executeUpdate();
                return i > 0;
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                pst = conn.prepareStatement("SELECT setval('users_id_seq', max(id)) " +
                        "FROM users;");
                pst.executeQuery();
                pst = conn.prepareStatement("INSERT INTO users(full_name, username, password,  telephone, role, email) VALUES ( '"+username+"', '"+full_name+"', '"+password+"', '"+telephone+"', '"+role+"', '"+email+"')");
                int i = pst.executeUpdate();
                return i > 0;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }


    public boolean updateUser(String full_name, String username, String password , String telephone, String role, String email) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();

        try {
            if (password == "") {
                pst = conn.prepareStatement("UPDATE users SET full_name=?, username=?, password=?, telephone=?, role=?, email=? WHERE username=?");
                pst.setString(1, full_name);
                pst.setString(2, username);
                pst.setString(3, password );
                pst.setString(4, telephone);
                pst.setString(5, role);
                pst.setString(6, email);
                int i = pst.executeUpdate();
                return i > 0;
            }
            else{
                    pst = conn.prepareStatement("UPDATE users " +
                            "SET full_name=?, username=?, password=?, telephone=?, role=?,  email=? " +
                            "WHERE username=?");
                    pst.setString(1, full_name);
                    pst.setString(2, username);
                    pst.setString(3, password );
                    pst.setString(4, telephone);
                    pst.setString(5, role);
                    pst.setString(6, email);

            }
            int i= pst.executeUpdate();
            return i>0;
        } catch (Exception e) {
            System.out.println("Something went wrong!");
            e.printStackTrace();
        }
            return false;
    }

    public boolean deleteUser(String username) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();

        try {
            pst = conn.prepareStatement("DELETE FROM users WHERE username=?");
            pst.setString(1, username);
            int i = pst.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            System.out.println("Something went wrong!");
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList getUserInfo(String username) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList userInfo = new ArrayList();
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT full_name " +
                    "FROM users " +
                    "WHERE username=?");
            pst.setString(1, username);
            rs = pst.executeQuery();
            if (rs.next()) {
                userInfo.add(username);
                userInfo.add(rs.getString("full_name"));
                userInfo.add(rs.getInt("email"));
                userInfo.add(rs.getInt("telephone"));
                userInfo.add(rs.getInt("role"));
                return userInfo;
            }
        }
        catch (Exception e) {
            System.out.println("Something went wrong!");
            e.printStackTrace();
        }
        return null;
    }

    //Anazitisi an yparxei to username
    public boolean searchUsername(String username) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT username " +
                    "FROM users " +
                    "WHERE username=?");
            pst.setString(1, username);
            rs = pst.executeQuery();
            if (rs.next()) {
                return true;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //Anazitisi an yparxei to email
    public boolean searchEmail(String _email) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT email " +
                    "FROM users " +
                    "WHERE email=?");
            pst.setString(1, _email);
            rs = pst.executeQuery();
            if (rs.next()) {
                return true;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public ArrayList viewAllUsers() {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        ArrayList allUsers = new ArrayList();

        try {
            pst = conn.prepareStatement("SELECT username FROM users ");
            rs = pst.executeQuery();

            while(rs.next()) {
                allUsers.add(rs.getString("username"));
            }
        } catch (Exception var6) {
            System.out.println("Something went wrong!");
            var6.printStackTrace();
        }

        return allUsers;
    }
    public ArrayList viewUsers() {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        ArrayList users = new ArrayList();
        try {
            pst = conn.prepareStatement("SELECT username " +
                    "FROM users " +
                    "WHERE role='User'");
            rs = pst.executeQuery();
            while (rs.next()) {
                users.add(rs.getString("username"));
            }
        }
        catch (Exception e) {
            System.out.println("Something went wrong!");
            e.printStackTrace();
        }
        return users;
    }





}
