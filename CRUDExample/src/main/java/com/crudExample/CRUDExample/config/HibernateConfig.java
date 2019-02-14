package com.crudExample.CRUDExample.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;

@Configuration
@ComponentScan(basePackages = "{com.crudExample.CRUDExample}")
public class HibernateConfig {
	// Database properties
	private final String DB_URL = "jdbc:mysql://localhost/employee_crud";
	private final String DB_DRIVER = "com.mysql.jdbc.Driver";
	private final String DB_DIALECT = "org.hibernate.dialect.MySQL5Dialect";
	private final String DB_USER = "root";
	private final String DB_PASS = "081321118618";
	
	// Datasource bean
	@Bean("dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setUrl(DB_URL);
		dataSource.setDriverClassName(DB_DRIVER);
		dataSource.setUsername(DB_USER);
		dataSource.setPassword(DB_PASS);
		
		return dataSource;
	}
	
	// Hibernate properties
	public Properties getHibernateProperties() {
		Properties hbmProperties = new Properties();
		hbmProperties.put("hibernate.dialect", DB_DIALECT);
		hbmProperties.put("hibernate.show_sql", "true");
		hbmProperties.put("hibernate.format_sql", "true");
		hbmProperties.put("hibernate.hbm2ddl.auto", "update");
		
		return hbmProperties;
	}
	
	// Session factory bean
	@Bean("sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource);
		builder.addProperties(getHibernateProperties());
		builder.scanPackages("com.crudExample.CRUDExample.dto");
		
		return builder.buildSessionFactory();
	}
 }
