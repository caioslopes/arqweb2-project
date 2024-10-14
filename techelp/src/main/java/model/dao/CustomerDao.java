package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

import javax.sql.DataSource;

import model.entity.Customer;

public class CustomerDao {

private DataSource dataSource;
	
	public CustomerDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public Boolean save(Customer customer){
		Optional<Customer> optional = getCustomerByEmail(customer.getEmail());
		if(optional.isPresent()) {
			return false;
		}
		String sql = "insert into customer (name, email, password, "
				+ "document, phone) values (?,?,?,?,?)";
		
		try(Connection conn = dataSource.getConnection(); 
				PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setString(1, customer.getName());
			ps.setString(2, customer.getEmail());
			ps.setString(3, customer.getPassword());
			ps.setString(4, customer.getDocument());
			ps.setString(5, customer.getPhone());
			ps.executeUpdate();
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a escrita no BD", e);
		}
		return true;
	}
	
	public Optional<Customer> getCustomerByEmail(String email){
		String sql = "select id,name,email from customer where email=?";
		Optional<Customer> optional = Optional.empty();
		
		try(Connection conn = dataSource.getConnection(); 
				PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setString(1, email);
			try(ResultSet rs = ps.executeQuery()) {
				if(rs.next()) {
					Customer Customer = new Customer();
					Customer.setId(rs.getLong(1));
					Customer.setName(rs.getString(2));
					Customer.setEmail(rs.getString(3));
					optional = Optional.of(Customer);
				}
			}
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a consulta no BD", e);
		}
		return optional;
	}
	
}
