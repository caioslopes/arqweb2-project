package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.sql.DataSource;

import model.entity.PaymentMethod;

public class PaymentMethodDao {

	private DataSource dataSource;

	public PaymentMethodDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public boolean save(PaymentMethod paymentMethod) {
		Optional<PaymentMethod> optional = getPaymentMethodByName(paymentMethod.getName());
		if(optional.isPresent()) {
			return false;
		}
		
		String sql = "INSERT INTO payment_method (name) VALUES (?)";
		
		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setString(1, paymentMethod.getName());
			ps.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("Erro durante a escrita no BD", e);
		}
		
		return true;
	}
	
	public Optional<PaymentMethod> getPaymentMethodByName(String name){
		String sql = "SELECT id,name FROM payment_method WHERE name=?";
		Optional<PaymentMethod> optional = Optional.empty();
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setString(1, name);
			try(ResultSet rs = ps.executeQuery()) {
				if(rs.next()) {
					PaymentMethod paymentMethod = new PaymentMethod();
					paymentMethod.setId(rs.getLong(1));
					paymentMethod.setName(rs.getString(2));
					optional = Optional.of(paymentMethod);
				}
			}
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a consulta no BD", e);
		}
		return optional;
	}
	
	public Optional<PaymentMethod> getPaymentMethodById(Long id){
		String sql = "SELECT id,name FROM payment_method WHERE id=?";
		Optional<PaymentMethod> optional = Optional.empty();
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setLong(1, id);
			try(ResultSet rs = ps.executeQuery()) {
				if(rs.next()) {
					PaymentMethod paymentMethod = new PaymentMethod();
					paymentMethod.setId(rs.getLong(1));
					paymentMethod.setName(rs.getString(2));
					optional = Optional.of(paymentMethod);
				}
			}
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a consulta no BD", e);
		}
		return optional;
	}
	
	public List<PaymentMethod> getPaymentMethods(){
		String sql = "SELECT id,name FROM payment_method";
		List<PaymentMethod> paymentMethods = new ArrayList<PaymentMethod>();
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql)){
			try(ResultSet rs = ps.executeQuery()) {
				while(rs.next()) {
					PaymentMethod paymentMethod = new PaymentMethod();
					paymentMethod.setId(rs.getLong(1));
					paymentMethod.setName(rs.getString(2));
					paymentMethods.add(paymentMethod);
				}
			}
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a consulta no BD", e);
		}
		
		return paymentMethods;
	}
	
}
