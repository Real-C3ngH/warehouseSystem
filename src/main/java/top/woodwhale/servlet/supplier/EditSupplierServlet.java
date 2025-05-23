package top.woodwhale.servlet.supplier;

import top.woodwhale.pojo.Supplier;
import top.woodwhale.service.supplier.ISupplierService;
import top.woodwhale.service.supplier.SupplierServiceImpl;
import top.woodwhale.utils.TextUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditSupplierServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String email = req.getParameter("email");
        if (!TextUtils.isEmpty(name) && !TextUtils.isEmpty(address) && !TextUtils.isEmpty(email)) {
            Supplier supplier = new Supplier();
            supplier.setName(name);
            supplier.setAddress(address);
            supplier.setEmail(email);
            supplier.setId(id);
            ISupplierService supplierService = SupplierServiceImpl.getSupplierService();
            int res = supplierService.editSupplierById(id, supplier);
            req.setAttribute("msg", res > 0 ? "更新供货商成功" : "更新供货商失败");
            req.setAttribute("head", "更新供货商");
            req.setAttribute("flag", res > 0 ? "1" : "0");
        }
        // 转发回登陆页面，写携带msg信息
        req.getRequestDispatcher("/jsp/supplier/info.jsp").forward(req, resp);
    }
}
