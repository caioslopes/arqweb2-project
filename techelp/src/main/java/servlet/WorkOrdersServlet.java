package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.WorkOrderDao;
import util.DataSourceSearcher;

import java.io.IOException;

@WebServlet("/WorkOrdersServlet")
public class WorkOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WorkOrdersServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WorkOrderDao workOrderDao = new WorkOrderDao(DataSourceSearcher.getInstance().getDataSource());
		request.setAttribute("workOrders", workOrderDao.getWorkOrders());
		RequestDispatcher dispatcher = null;
		dispatcher = request.getRequestDispatcher("/authenticated/employee/work-orders/work-orders.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
