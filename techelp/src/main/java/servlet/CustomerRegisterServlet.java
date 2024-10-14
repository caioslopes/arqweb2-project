package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.CustomerDao;
import model.entity.Customer;
import util.DataSourceSearcher;
import util.PasswordEncoder;

import java.io.IOException;

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
		
		Customer customer = new Customer();
		customer.setName(name);
		customer.setEmail(email);
		customer.setPassword(PasswordEncoder.encode(password));
		customer.setDocument(document);
		customer.setPhone(phone);
		
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
