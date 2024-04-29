package com.cabinetdoctor.Info;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static com.cabinetdoctor.Info.BDInfo.url;
import static com.cabinetdoctor.Info.BDInfo.password;
import static com.cabinetdoctor.Info.BDInfo.user;

public class ConnectionDB {
    public static Connection con;
    public static void seconnecter() throws Exception{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException ex) {
            throw new Exception("Impossible de trouvé le Driver !!!");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
