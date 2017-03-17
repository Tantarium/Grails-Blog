package blog

import com.manifestcorp.*

class BootStrap {

    def init = { servletContext ->
        def me = new User(username: 'Lp3', password: 'password').save()
        def userRole = new Role(authority: 'ROLE_USER').save()

        UserRole.create me, userRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }
    }

    def destroy = {}
}
