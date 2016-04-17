/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Joyce
 */
public abstract class Tabela
{
    static Connection connection;
    static
    {
        try
        {
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "bd3", "root");
        } catch (SQLException ex)
        {
            Logger.getLogger(Tabela.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void Insert() throws IllegalArgumentException, IllegalAccessException
    {
        try
        {
            String insertQuery, columns, values;
            Field[] fields = getClass().getDeclaredFields();
            
            values = FieldValue(fields[0]);
            columns = fields[0].getName();
            
            for (int fieldIndex = 1; fieldIndex < fields.length; fieldIndex++)
            {
                values += ", " + FieldValue(fields[fieldIndex]);
                columns += ", " + fields[fieldIndex].getName();
            }
            
            insertQuery = "INSERT INTO " + getClass().getSimpleName().toUpperCase() + "(" + columns.toUpperCase() + ") VALUES (" + values.toUpperCase() + ")";
            
            Statement stmt = connection.createStatement();
    	    ResultSet rs = stmt.executeQuery(insertQuery);

	    rs.close();
	    stmt.close();
	    
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }
    protected static SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
    private String FieldValue(Field field) throws IllegalArgumentException, IllegalAccessException
    {
        Class fieldType = field.getType();

        if (fieldType == int.class)
            return field.get(this).toString();

        if (fieldType == String.class)
            return "'" + field.get(this) + "'";

        if (fieldType == Calendar.class)
            return "'" + format.format(((Calendar)field.get(this)).getTime()) + "'";
        
        return null;
    }
}