package com.devs.sso.server.model.domain.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "MEMBER_PROFILE")
@Entity
public class MemberProfile {

	@Id
	@Column(name = "MEMBER_CODE")
	private int member_code;

	@Column(name = "MEMBER_IMG_ORIGINAL_NAME")
	private String member_img_original_name;

	@Column(name = "MEMBER_IMG_SERVER_NAME")
	private String member_img_server_name;

	@Column(name = "MEMBER_IMG_PATH")
	private String member_img_path;

	@Column(name = "MEMBER_WEBSITE")
	private String member_website;

	@Column(name = "MEMBER_INTRODUCE")
	private String member_introduce;

	@Column(name = "MEMBER_GENDER")
	private String member_gender;
}
