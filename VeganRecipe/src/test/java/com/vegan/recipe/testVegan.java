package com.vegan.recipe;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class testVegan {
private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
private static final String URL = "jdbc:mysql://localhost:3306/recipe_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true"; 
private static final String USER = "recipe"; 
private static final String PW = "!Alcls1475";
@Test
public void testConnection() throws Exception{
	Class.forName(DRIVER); try(Connection conn = DriverManager.getConnection(URL, USER, PW)){ 
		System.out.println(conn);
	 } catch (Exception e) { 
		 e.printStackTrace();
	}
}
}


