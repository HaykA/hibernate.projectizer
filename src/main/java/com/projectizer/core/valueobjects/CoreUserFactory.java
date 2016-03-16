package com.projectizer.core.valueobjects;

import com.projectizer.core.entities.AuthUser;

public final class CoreUserFactory {
	private CoreUserFactory() {}
	
	public static CoreUser createCoreUser(AuthUser authUser) {
		return new CoreUser(authUser.getId(), authUser.getType());
	}
}
