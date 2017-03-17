package com.manifestcorp

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class UserRole implements Serializable {

	private static final long serialVersionUID = 1

	User admin
	Role administrator

	@Override
	boolean equals(other) {
		if (!(other instanceof UserRole)) {
			return false
		}

		other.admin?.id == admin?.id && other.administrator?.id == administrator?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (admin) builder.append(admin.id)
		if (administrator) builder.append(administrator.id)
		builder.toHashCode()
	}

	static UserRole get(long adminId, long administratorId) {
		criteriaFor(adminId, administratorId).get()
	}

	static boolean exists(long adminId, long administratorId) {
		criteriaFor(adminId, administratorId).count()
	}

	private static DetachedCriteria criteriaFor(long adminId, long administratorId) {
		UserRole.where {
			admin == User.load(adminId) &&
			administrator == Role.load(administratorId)
		}
	}

	static UserRole create(User admin, Role administrator, boolean flush = false) {
		def instance = new UserRole(admin: admin, administrator: administrator)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(User u, Role r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = UserRole.where { admin == u && administrator == r }.deleteAll()

		if (flush) { UserRole.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(User u, boolean flush = false) {
		if (u == null) return

		UserRole.where { admin == u }.deleteAll()

		if (flush) { UserRole.withSession { it.flush() } }
	}

	static void removeAll(Role r, boolean flush = false) {
		if (r == null) return

		UserRole.where { administrator == r }.deleteAll()

		if (flush) { UserRole.withSession { it.flush() } }
	}

	static constraints = {
		administrator validator: { Role r, UserRole ur ->
			if (ur.admin == null || ur.admin.id == null) return
			boolean existing = false
			UserRole.withNewSession {
				existing = UserRole.exists(ur.admin.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['admin', 'administrator']
		version false
	}
}
