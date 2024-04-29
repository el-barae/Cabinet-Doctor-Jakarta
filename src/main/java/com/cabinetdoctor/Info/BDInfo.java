package com.cabinetdoctor.Info;
public class BDInfo {
	protected static String bdName = "cabinet_doctor";
	protected static String protocol = "jdbc:mysql:";
	public static String user = "root";
	public static String password = "1234abcD.";
	protected static String ip = "127.0.0.1";
	protected static int port = 3306;
	public static String url = protocol + "//" + ip + ":" + port + "/" + bdName;
        protected static String filesPath = System.getProperty("user.dir") + "/src/cabinetdoctor/Files/";
        protected static String photoPath = System.getProperty("user.dir") + "/src/cabinetdoctor/photo/cabinet.jpg";
}
