package Members;

import Administrators.Appointments;
import Utils.Connect_Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Patients {

    Appointments appointments = new Appointments();
    public Patients(){}

    public ArrayList showAvaliableAppointments(){
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs =null;
        conn = Connect_Database.getConnection();
        ArrayList availableApp = new ArrayList();
        try {
            pst = conn.prepareStatement("SELECT appid " +
                    "FROM appointments  " + "WHERE is_available=true");
            rs = pst.executeQuery();
            while (rs.next()) {
                availableApp.add(rs.getInt("appid"));
            }
        }
        catch (Exception e) {
            System.out.println("Something went wrong!");
            e.printStackTrace();
            return null;
        }
        return availableApp;

    }
    public void makeApp(int id, int doct_id, String description, String date){
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs =null;
        try {
            pst = conn.prepareStatement("");
        }
        catch (Exception e) {
            System.out.println("Something went wrong!");
            e.printStackTrace();
            //return null;
        }

    }

}
