package servlet;

import manager.ToDoManager;
import model.ToDo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/todolist")
public class ToDoListServlet extends HttpServlet {

    ToDoManager toDoManager = new ToDoManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ToDo> all = toDoManager.getAll();
        req.setAttribute("todos", all);
        req.getRequestDispatcher("/WEB-INF/todolist.jsp").forward(req, resp);
    }


}


