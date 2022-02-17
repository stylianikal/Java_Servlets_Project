package Members;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Doctor extends Users {

    private final String date;
    private String specialty;

    Doctor(){
        specialty = "";
        role = "Doctor";
        date = "";
    }
    public void setRole( String role){
        this.role = "Doctor";
    }

    public void setSpecialty( String specialty){
        this.specialty = specialty;
    }

    public String getSpecialty(){
        return specialty;
    }


    void PrintDoctorInfo(){
        super.PrintUserInfo();
        System.out.println("Doctor's Specialty: " +specialty);
    }

    /*
     * Diathesimotita giatrou
     */
    void SetAvailability( Date avail_date){
        System.out.println("Availability changed...");
        System.out.println(new SimpleDateFormat("MM-dd-yyyy HH:mm:ss").format(avail_date));
        System.out.println();
    }

    void DisplayAvailability(){
        System.out.println("Your schedule is: ");
        System.out.println();
    }

    void GetNextAppointment(){
        System.out.println("Your next appointment is at:");
        System.out.println("Patient Name: ");
        System.out.println();
    }
}
