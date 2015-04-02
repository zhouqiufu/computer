package com.publicAction;

import com.opensymphony.xwork2.ActionSupport;

public class pagingAction extends ActionSupport {

	private int number;

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String execute() {

		if (number == 600 || number == 610 || number == 620 || number == 630
				|| number == 640 || number == 650 || number == 660
				|| number == 670) {
			
			if(number==600){
				return "DN";
			}
			
			if(number==610){
				return "Announce";
			}
			
			if(number==620){
				return "Technology";
			}
		}

		return ERROR;
	}
}
