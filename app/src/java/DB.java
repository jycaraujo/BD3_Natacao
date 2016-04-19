/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Joyce
 */
public final class DB
{
    private static Connection connection;
    public static SimpleDateFormat dateFormat;
    static
    {
        try
        {
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "bd3", "root");
            dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        } catch (Exception ex)
        {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static <T> void Insert(T t)
    {
        try
        {
            String insertQuery, columns, values;
            Field[] fields = t.getClass().getDeclaredFields();
            
            values = FieldValue(t, fields[0]);
            columns = fields[0].getName();
            
            for (int fieldIndex = 1; fieldIndex < fields.length; fieldIndex++)
            {
                values += ", " + FieldValue(t, fields[fieldIndex]);
                columns += ", " + fields[fieldIndex].getName().split("_")[0];
            }
            
            insertQuery = "INSERT INTO " + t.getClass().getSimpleName().toUpperCase() + "(" + columns.toUpperCase() + ") VALUES (" + values.toUpperCase() + ")";
            
            Statement stmt = connection.createStatement();
    	    ResultSet rs = stmt.executeQuery(insertQuery);

	    rs.close();
	    stmt.close();
	    
	} catch (Exception e) {
	    System.out.println(e);
	}
    }

    private static <T> String FieldValue(T t, Field field) throws IllegalArgumentException, IllegalAccessException
    {
        Class fieldType = field.getType();

        if (fieldType == int.class)
        {
            if (field.getName() == "id")
                return "SEQ_" + t.getClass().getSimpleName().toUpperCase() + "_IDENTITY_ID.NEXTVAL";
            else
                return field.get(t).toString();
        }

        if (fieldType == String.class)
            return "'" + field.get(t) + "'";

        if (fieldType == Date.class)
        {
            if (field.getName().endsWith("_date"))
                return "TO_DATE('" + dateFormat.format((Date)field.get(t)) + "', '" + dateFormat.toPattern() + "')";
        }
        
        return null;
    }

    public static <T> List<T> SelectAll(Class<T> c)
    {
        List<T> results = new ArrayList<T>();

        try
        {
            String selectQuery = "SELECT * FROM " + c.getSimpleName().toUpperCase();
            
            Field[] fields = c.getDeclaredFields();

            Statement stmt = connection.createStatement();
    	    ResultSet rs = stmt.executeQuery(selectQuery);

            while (rs.next())
            {
                T t = c.newInstance();
                
                for (Field field : fields)
                {
                    String fieldValue = rs.getString(field.getName().toUpperCase());
                    
                    if (field.getType() == int.class)
                        field.set(t, Integer.parseInt(fieldValue));

                    else if (field.getType() == String.class)
                        field.set(t, fieldValue);

                    else if (field.getType() == Date.class)
                    {
                        if (field.getName().endsWith("_date"))
                            field.set(t, dateFormat.parse(fieldValue));
                    }
                }
                
                results.add(t);
            }
            
	    rs.close();
	    stmt.close();
            
	} catch (Exception e) {
	    System.out.println(e);
	}
        
        return results;
    }
}