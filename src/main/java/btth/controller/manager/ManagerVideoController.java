package btth.controller.manager;

import java.io.File;
import java.io.IOException;
import java.util.List;

import btth.entity.Video;
import btth.entity.Users;
import btth.services.VideoServices;
import btth.services.impl.VideoServicesImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet({"/manager/video", "/manager/video/add", "/manager/video/edit", "/manager/video/delete"})
@MultipartConfig
public class ManagerVideoController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VideoServices videoService = new VideoServicesImpl();

    private static final String UPLOAD_DIR = "D:\\Ki1_Nam3\\ltWeb\\VideoUploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Users manager = (Users) session.getAttribute("user");
        String uri = req.getRequestURI();

        if (uri.endsWith("/video")) {
            List<Video> list = videoService.findByUserID(manager.getId());
            req.setAttribute("videos", list);
            req.getRequestDispatcher("/views/manager/videolist.jsp").forward(req, resp);

        } else if (uri.endsWith("delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Video v = videoService.findById(id);

            if (v != null && v.getUser().getId() == manager.getId()) {
                videoService.delete(id);
            }
            resp.sendRedirect(req.getContextPath() + "/manager/video");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Users manager = (Users) session.getAttribute("user");
        String uri = req.getRequestURI();

        if (uri.endsWith("add")) {
            String title = req.getParameter("title");
            boolean status = req.getParameter("status") != null;

            Part filePart = req.getPart("file"); // input name="file"
            String fileName = filePart.getSubmittedFileName();

            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) uploadDir.mkdirs();
            filePart.write(UPLOAD_DIR + File.separator + fileName);

            Video v = new Video();
            v.setTitle(title);
            v.setUrl(fileName); // chỉ lưu tên file
            v.setStatus(status);
            v.setUser(manager);

            videoService.create(v);
            resp.sendRedirect(req.getContextPath() + "/manager/video");

        } else if (uri.endsWith("edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Video v = videoService.findById(id);

            if (v != null && v.getUser().getId() == manager.getId()) {
                v.setTitle(req.getParameter("title"));
                v.setStatus(req.getParameter("status") != null);

                Part filePart = req.getPart("file");
                String fileName = filePart.getSubmittedFileName();
                if (fileName != null && !fileName.isEmpty()) {
                    File uploadDir = new File(UPLOAD_DIR);
                    if (!uploadDir.exists()) uploadDir.mkdirs();
                    filePart.write(UPLOAD_DIR + File.separator + fileName);
                    v.setUrl(fileName);
                }

                videoService.update(v);
            }
            resp.sendRedirect(req.getContextPath() + "/manager/video");
        }
    }
}
