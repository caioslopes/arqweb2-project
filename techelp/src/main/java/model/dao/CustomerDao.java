package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
		String sql = "INSERT INTO customer (name, email, password, document, phone, active, street, number, additional_info, neighborhood, postal_code, city, state) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setString(1, customer.getName());
			ps.setString(2, customer.getEmail());
			ps.setString(3, customer.getPassword());
			ps.setString(4, customer.getDocument());
			ps.setString(5, customer.getPhone());
			ps.setBoolean(6, customer.getActive());
			ps.setString(7, customer.getAddress().getStreet());
			ps.setString(8, customer.getAddress().getNumber());
			ps.setString(9, customer.getAddress().getAdditionalInfo());
			ps.setString(10, customer.getAddress().getNeighborhood());
			ps.setString(11, customer.getAddress().getPostalCode());
			ps.setString(12, customer.getAddress().getCity());
			ps.setString(13, customer.getAddress().getState());
			ps.executeUpdate();
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a escrita no BD", e);
		}
		return true;
	}

	public Optional<Customer> getCustomerByEmail(String email){
		String sql = "SELECT id,name,email FROM customer WHERE email=?";
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
	
	public Optional<Customer> getCustomerById(Long id){
		String sql = "SELECT id,name,email FROM customer WHERE id=?";
		Optional<Customer> optional = Optional.empty();

		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setLong(1, id);
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
	
	public List<Customer> getCustomers(){
		String sql = "SELECT id,name,email,phone FROM customer";
		List<Customer> customers = new ArrayList<Customer>();

		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql)){
			try(ResultSet rs = ps.executeQuery()) {
				while(rs.next()) {
					Customer Customer = new Customer();
					Customer.setId(rs.getLong(1));
					Customer.setName(rs.getString(2));
					Customer.setEmail(rs.getString(3));
					Customer.setPhone(rs.getString(4));
					customers.add(Customer);
				}
			}
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a consulta no BD", e);
		}
		return customers;
	}

}
