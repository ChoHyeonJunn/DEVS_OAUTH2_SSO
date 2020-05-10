package com.devs.sso.server.service;

import org.springframework.data.repository.CrudRepository;

import com.devs.sso.server.domain.Client;

public interface ClientRepository extends CrudRepository<Client, String> {
	//
}
