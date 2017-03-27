package blog

import com.manifestcorp.*

class BootStrap {

    def init = { servletContext ->
        def randomUser = new User(username: 'random', password: 'password').save()
        def userRole = new Role(authority: 'ROLE_RANDOM').save()
        def admin = new User(username: 'Lp3', password: 'password').save()
        def adminRole = new Role(authority: 'ROLE_USER').save()

        UserRole.create randomUser, userRole
        UserRole.create admin, adminRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }
    }

    def destroy = {}
}
