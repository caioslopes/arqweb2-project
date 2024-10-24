package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.sql.DataSource;

import model.entity.Customer;
import model.entity.WorkOrder;
import model.type.StatusType;

public class WorkOrderDao {

	private DataSource dataSource;

	public WorkOrderDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public boolean save(WorkOrder workOrder) {
		String sql = "INSERT INTO work_order (description,created_at,price,observation,status,payment_method_id,customer_id) VALUES (?,?,?,?,?,?,?)";
		
		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setString(1, workOrder.getDescription());
			ps.setDate(2, Date.valueOf(workOrder.getCreatedAt()));
//			ps.setDate(3, Date.valueOf(workOrder.getCompletedAt()));
			ps.setBigDecimal(3, workOrder.getPrice());
			ps.setString(4, workOrder.getObservation());
			ps.setString(5, workOrder.getStatus().toString());
			ps.setLong(6, workOrder.getPaymentMethod().getId());
			ps.setLong(7, workOrder.getCustomer().getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("Erro durante a escrita no BD", e);
		}
		
		return true;
	}
	
//	public Optional<WorkOrder> getWorkOrderById(){
//		
//	}
	
	public List<WorkOrder> getWorkOrders(){
		String sql = "SELECT id,description,created_at,status,customer_id FROM work_order";
		List<WorkOrder> workOrders = new ArrayList<WorkOrder>();
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql)){
			try(ResultSet rs = ps.executeQuery()) {
				while(rs.next()) {
					WorkOrder workOrder = new WorkOrder();
					workOrder.setId(rs.getLong(1));
					workOrder.setDescription(rs.getString(2));
					workOrder.setCreatedAt(LocalDate.parse(rs.getDate(3).toString()));
					workOrder.setStatus(StatusType.valueOf(rs.getString(4)));
					
					CustomerDao customerDao = new CustomerDao(dataSource);
					Optional<Customer> optionalCustomer = customerDao.getCustomerById(rs.getLong(5));
					
					if(optionalCustomer.isPresent()) {
						workOrder.setCustomer(optionalCustomer.get());
					}
					
					workOrders.add(workOrder);
				}
			}
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a consulta no BD", e);
		}
		
		return workOrders;
	}
	
}
