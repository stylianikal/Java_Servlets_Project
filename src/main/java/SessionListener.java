import Members.Users;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener {
    public void sessionDestroyed(HttpSessionEvent e) {
        String username_Session = (String) e.getSession().getAttribute("username");
        Users users = new Users();

    }

    public void sessionCreated(HttpSessionEvent e) {}
}