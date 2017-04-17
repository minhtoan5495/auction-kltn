package main.app;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class GetDate {
	Date createDate;
	Date shipDate;
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public Date getShipDate() {
		return shipDate;
	}

	public void setShipDate(Date shipDate) {
		this.shipDate = shipDate;
	}

	public static void main(String[] args) throws ParseException {
		SimpleDateFormat sm=new SimpleDateFormat("dd-MM-yyyy");
		Calendar c1=Calendar.getInstance();
		Calendar c2=Calendar.getInstance();
		Date create=new Date();
		c1.setTime(create);
		c2.setTime(create);
		System.out.println("Ngày đầu:"+sm.format(c1.getTime()));
		c1.roll(Calendar.DATE, 7);
		String a = sm.format(c1.getTime());
		GetDate gD=new GetDate();
		gD.setShipDate(sm.parse(a));
		System.out.println("Ngày sau khi tăng"+sm.format(gD.getShipDate()));
	}
}
