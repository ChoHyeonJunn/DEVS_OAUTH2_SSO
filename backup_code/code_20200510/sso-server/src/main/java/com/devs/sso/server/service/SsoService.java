package com.devs.sso.server.service;

import com.devs.sso.server.domain.AccessToken;

public interface SsoService {
	//
	AccessToken getAccessToken(String token, String clientId);
	
	String logoutAllClients(String clientId, String userName);
}
