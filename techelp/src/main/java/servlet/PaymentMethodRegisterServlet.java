package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.PaymentMethodDao;
import model.entity.PaymentMethod;
import util.DataSourceSearcher;

import java.io.IOException;

@WebServlet("/PaymentMethodRegisterServlet")
public class PaymentMethodRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PaymentMethodRegisterServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		
		PaymentMethod paymentMethod = new PaymentMethod();
		paymentMethod.setName(name);
		
		PaymentMethodDao paymentMethodDao = new PaymentMethodDao(DataSourceSearcher.getInstance().getDataSource());
		
		RequestDispatcher dispatcher = null;
		
		if(paymentMethodDao.save(paymentMethod)) {
			request.setAttribute("result", "registered");
			dispatcher = request.getRequestDispatcher("/PaymentMethodsServlet");
		}else {
			request.setAttribute("result", "notRegistered");
			dispatcher = request.getRequestDispatcher("/PaymentMethodsServlet");
		}
		
		dispatcher.forward(request, response);
		
	}

}
