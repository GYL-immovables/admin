package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

public class notice_modify extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String nidx = request.getParameter("nidx");
        if (nidx == null || nidx.trim().equals("")) {
            response.sendRedirect("./notice_list.do");
            return;
        }

        admin.m_noticeview mv = new admin.m_noticeview();
        ArrayList<String> notice_v = mv.view(Integer.parseInt(nidx));

        request.setAttribute("notice_v", notice_v);
        request.setAttribute("nidx", nidx);

        RequestDispatcher rd = request.getRequestDispatcher("./notice_modify.jsp");
        rd.forward(request, response);
    }
}
