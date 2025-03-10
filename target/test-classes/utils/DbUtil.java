package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DbUtil {
	
	public static void main(String[] args) {
		executeQuery("SELECT * FROM practice.employee");
	}

    public static List<Map<String, Object>> executeQuery(String query) {
        List<Map<String, Object>> rows = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/practice", "root", "root");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            int columnCount = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    row.put(rs.getMetaData().getColumnName(i), rs.getObject(i));
                }
                System.out.println(row);
                rows.add(row);
                
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows;
    }
}