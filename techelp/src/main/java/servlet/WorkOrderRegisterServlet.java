package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.CustomerDao;
import model.dao.PaymentMethodDao;
import model.dao.WorkOrderDao;
import model.entity.Customer;
import model.entity.PaymentMethod;
import model.entity.WorkOrder;
import model.type.StatusType;
import util.DataSourceSearcher;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Optional;

@WebServlet("/WorkOrderRegisterServlet")
public class WorkOrderRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WorkOrderRegisterServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String description = request.getParameter("description");
//		String createdAt = request.getParameter("createdAt");
//		String completedAt = request.getParameter("completedAt");
		String price = request.getParameter("price");
		String observation = request.getParameter("observation");
//		String status = request.getParameter("status");
		String customerId = request.getParameter("customerId");
		String paymentMethodId = request.getParameter("paymentMethodId");
		
		WorkOrder workOrder = new WorkOrder();
		workOrder.setDescription(description);
		workOrder.setCreatedAt(LocalDate.now());
//		workOrder.setCompletedAt(LocalDate.parse(completedAt));
		workOrder.setPrice(new BigDecimal(price));
		workOrder.setObservation(observation);
		workOrder.setStatus(StatusType.PENDING_APPROVAL);
		
		CustomerDao customerDao = new CustomerDao(DataSourceSearcher.getInstance().getDataSource());
		Optional<Customer> optionalCustomer = customerDao.getCustomerById(Long.parseLong(customerId));
		
		if(optionalCustomer.isPresent()) {
			workOrder.setCustomer(optionalCustomer.get());
		}
		
		PaymentMethodDao paymentMethodDao = new PaymentMethodDao(DataSourceSearcher.getInstance().getDataSource());
		Optional<PaymentMethod> optionalPaymentMethod = paymentMethodDao.getPaymentMethodById(Long.parseLong(paymentMethodId));
		
		if(optionalPaymentMethod.isPresent()) {
			workOrder.setPaymentMethod(optionalPaymentMethod.get());
		}
		
		RequestDispatcher dispatcher = null;

		WorkOrderDao workOrderDao = new WorkOrderDao(DataSourceSearcher.getInstance().getDataSource());

		if(workOrderDao.save(workOrder)) {
			request.setAttribute("result", "registered");
			dispatcher = request.getRequestDispatcher("/WorkOrdersServlet");
		}else {
			request.setAttribute("result", "notRegistered");
			dispatcher = request.getRequestDispatcher("/WorkOrdersServlet");
		}

		dispatcher.forward(request, response);
		
	}

}
