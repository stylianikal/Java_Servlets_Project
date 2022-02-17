package Members;

import Utils.Connect_Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Users {

    private int id;
    private String full_name;
    private String username;
    private String password;
    private String telephone;
    String role;
    private String email;


    public Users(){}

    public Users(int id, String full_name, String username, String password, String telephone,String role, String email) {
        this.id = id;
        this.full_name = full_name;
        this.username = username;
        this.password = password;
        this.telephone = telephone;
        this.role = role;
        this.email = email;

    }
    protected void PrintUserInfo(){
        System.out.println("User Information:");
        System.out.println("Full Name: " + full_name);
        System.out.println("User Name: " + username);
        System.out.println("Telephone: " + password);
        System.out.println("Email:  "+ email);
    }

    public int getUserId(String _username) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT id " +
                    "FROM users " +
                    "WHERE username=?");
            pst.setString(1, _username);
            rs = pst.executeQuery();
            if (rs.next()) {
                id = rs.getInt("id");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }
    //  Get gia full name xristi
    public String getFullName(String _username) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT full_name " +
                    "FROM users " +
                    "WHERE username=?");
            pst.setString(1, _username);
            rs = pst.executeQuery();
            if (rs.next()) {
                full_name = rs.getString("full_name");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return full_name;
    }
    //  Get for full name xristi
    public String getEmail(String _username) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT email " +
                    "FROM users " +
                    "WHERE username=?");
            pst.setString(1, _username);
            rs = pst.executeQuery();
            if (rs.next()) {
                email = rs.getString("email");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return email;
    }

    //  Get for username
    public String getUsername(int _id) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT username " +
                    "FROM users " +
                    "WHERE id=?");
            pst.setInt(1, _id);
            rs = pst.executeQuery();
            if (rs.next()) {
                username = rs.getString("username");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return username;
    }

    //  Get for password
    public String getPassword(String _username) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT password " +
                    "FROM users " +
                    "WHERE username=?");
            pst.setString(1, _username);
            rs = pst.executeQuery();
            if (rs.next()) {
                password = rs.getString("password");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return password;
    }
    //  Get for telephone
    public String getTelephone(String _username) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT telephone " +
                    "FROM users " +
                    "WHERE username=?");
            pst.setString(1, _username);
            rs = pst.executeQuery();
            if (rs.next()) {
                telephone = rs.getString("telephone");
                if (telephone == null) {
                    telephone = "";
                }
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return telephone;
    }

    //  Get for telephone
    public String getUsertype(String _username) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("SELECT role " +
                    "FROM users " +
                    "WHERE username=?");
            pst.setString(1, _username);
            rs = pst.executeQuery();
            if (rs.next()) {
                role = rs.getString("role");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return role;
    }

    // Set gia full name xristi
    public void setFullName(int _userId, String _full_name) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("UPDATE users " +
                    "SET full_name=? " +
                    "WHERE id=?");
            pst.setString(1, _full_name);
            pst.setInt(2, _userId);
            int i = pst.executeUpdate();
            if (i > 0) {
                this.full_name = _full_name;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setUsername(int _userId, String _username) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("UPDATE users " +
                    "SET username=? " +
                    "WHERE id=?");
            pst.setString(1, _username);
            pst.setInt(2, _userId);
            int i = pst.executeUpdate();
            if (i > 0) {
                this.username = _username;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Set gia email xristi
    public void setEmail(int _userId, String _email) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("UPDATE users " +
                    "SET email=? " +
                    "WHERE id=?");
            pst.setString(1, _email);
            pst.setInt(2, _userId);
            int i = pst.executeUpdate();
            if (i > 0) {
                this.email = _email;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Set gia tilefono xristi
    public void setTelephone(int _Id, String _telephone) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();
        try {
            pst = conn.prepareStatement("UPDATE users " +
                    "SET telephone=? " +
                    "WHERE id=?");
            pst.setString(1, _telephone);
            pst.setInt(2, _Id);
            int i = pst.executeUpdate();
            if (i > 0) {
                this.telephone = _telephone;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setPassword(int _id, String _newPassword) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        conn = Connect_Database.getConnection();

        try {
            pst = conn.prepareStatement("UPDATE users " +
                    "SET password=? " +
                    "WHERE id=?");
            pst.setString(1, _newPassword);
            pst.setInt(2, _id);
            int i = pst.executeUpdate();
            if (i > 0) {
                this.id = _id;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }


}