package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.CustomerDao;
import model.entity.Address;
import model.entity.Customer;
import util.DataSourceSearcher;
import util.PasswordEncoder;

@WebServlet("/customerRegister")
public class CustomerRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomerRegisterServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String document = request.getParameter("document");
		String phone = request.getParameter("phone");
		String active = request.getParameter("active");
		String street = request.getParameter("street");
		String number = request.getParameter("number");
		String additional_info = request.getParameter("additional_info");
		String neighborhood = request.getParameter("neighborhood");
		String postal_code = request.getParameter("postal_code");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		
		Customer customer = new Customer();
		customer.setName(name);
		customer.setEmail(email);
		customer.setPassword(PasswordEncoder.encode(password));
		customer.setDocument(document);
		customer.setPhone(phone);
		customer.setActive(Boolean.valueOf(active));
		
		Address address = new Address();
		address.setStreet(street);
		address.setNumber(number);
		address.setAdditionalInfo(additional_info);
		address.setNeighborhood(neighborhood);
		address.setPostalCode(postal_code);
		address.setCity(city);
		address.setState(state);
		
		customer.setAddress(address);
		
		RequestDispatcher dispatcher = null;
		
		CustomerDao customerDao = new CustomerDao(DataSourceSearcher.getInstance().getDataSource());		
		
		if(customerDao.save(customer)) {
			request.setAttribute("result", "registered");
			dispatcher = request.getRequestDispatcher("/index.jsp");
		}else {
			request.setAttribute("result", "notRegistered");
			dispatcher = request.getRequestDispatcher("/index.jsp");
		}
		
		dispatcher.forward(request, response);
	}

}
