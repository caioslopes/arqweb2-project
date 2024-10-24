package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.PaymentMethodDao;
import util.DataSourceSearcher;

import java.io.IOException;

@WebServlet("/PaymentMethodsServlet")
public class PaymentMethodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PaymentMethodsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PaymentMethodDao paymentMethodDao = new PaymentMethodDao(DataSourceSearcher.getInstance().getDataSource());
		request.setAttribute("paymentMethods", paymentMethodDao.getPaymentMethods());
		RequestDispatcher dispatcher = null;
		dispatcher = request.getRequestDispatcher("/authenticated/employee/payment-methods/payment-methods.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
