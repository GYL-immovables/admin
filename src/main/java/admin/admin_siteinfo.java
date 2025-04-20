package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

public class admin_siteinfo extends HttpServlet {
    private static final long serialVersionUID = 1L;
    PrintWriter pw = null;

    // GET 요청 → DB에 데이터 저장 + 조회 후 index.jsp로 전달
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        this.pw = response.getWriter();

        // 2️. DTO 객체 생성 및 값 저장
        dto_setting dto = new dto_setting();
        dto.setAtitle(request.getParameter("atitle"));
        dto.setAemail(request.getParameter("aemail"));
        dto.setApoint_use(request.getParameter("apoint_use"));
        dto.setSign_point(request.getParameter("sign_point"));
        dto.setSign_lv(request.getParameter("sign_lv"));
        dto.setComp_nm(request.getParameter("comp_nm"));
        dto.setBusiness_no(request.getParameter("business_no"));
        dto.setCeo_nm(request.getParameter("ceo_nm"));
        dto.setTel(request.getParameter("tel"));
        dto.setCom_no(request.getParameter("com_no"));
        dto.setAdd_no(request.getParameter("add_no"));
        dto.setAddr_no(request.getParameter("addr_no"));
        dto.setCom_addr(request.getParameter("com_addr"));
        dto.setInfo_nm(request.getParameter("info_nm"));
        dto.setInfo_email(request.getParameter("info_email"));
        dto.setBank_nm(request.getParameter("bank_nm"));
        dto.setBank_no(request.getParameter("bank_no"));
        dto.setCard_use(request.getParameter("card_use"));
        dto.setMobile_use(request.getParameter("mobile_use"));
        dto.setBook_coupon(request.getParameter("book_coupon"));
        dto.setMin_point(request.getParameter("min_point"));
        dto.setMax_point(request.getParameter("max_point"));
        dto.setCash_receipt(request.getParameter("cash_receipt"));
        dto.setDel_com(request.getParameter("del_com"));
        dto.setDel_price(request.getParameter("del_price"));
        dto.setDel_date(request.getParameter("del_date"));

        // 3️. dto.getAtitle()가 NULL인지 확인
        if (dto.getAtitle() == null) {
            System.out.println("dto.getAtitle() 값이 NULL 입니다.");
        } else if (dto.getAtitle().isEmpty()) {
            System.out.println("dto.getAtitle() 값이 빈 문자열입니다.");
        } else {
            System.out.println("dto.getAtitle() 정상: " + dto.getAtitle());
        }

        // 4️. DB 저장 실행
        if (dto.getAtitle() != null && !dto.getAtitle().isEmpty()) {
            m_setting set = new m_setting();
            boolean result = set.insertSet(dto);
            if (result) {
                System.out.println("GET 요청을 통해 DB INSERT 성공!");
            } else {
                System.out.println("GET 요청을 통해 DB INSERT 실패!");
            }
        }

        // 5️. DB에서 최신 데이터 가져오기**
        m_copyright cp = new m_copyright();
        m_title ti = new m_title();
        ArrayList<dto_setting> copyright = cp.cpdata();
        ti.getTitle();
        String db_ti = ti.getSettingData().getAtitle();

        // 6️. 데이터 가져오기 디버깅**
        if (!copyright.isEmpty()) {
            System.out.println("DB에서 가져온 회사명: " + copyright.get(0).getComp_nm());
        } else {
            System.out.println("DB에서 회사명을 가져오지 못했습니다!");
        }
        System.out.println("DB에서 가져온 홈페이지 제목: " + db_ti);
        
        System.out.println("request.setAttribute 직전: copyright.size() = " + copyright.size());
        request.setAttribute("copyright", copyright);
        
        // 7. JSP로 데이터 전달
        getServletContext().setAttribute("copyright", copyright);
        request.setAttribute("title", db_ti);

        // 8️. 페이지 이동
        RequestDispatcher rd = request.getRequestDispatcher("/admin_siteinfo.jsp");
        rd.forward(request, response);
    }
}
