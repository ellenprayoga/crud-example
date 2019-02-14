package com.crudExample.CRUDExample.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "programing_language")
public class ProgLang {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String progLang;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProgLang() {
		return progLang;
	}

	public void setProgLang(String progLang) {
		this.progLang = progLang;
	}
}
