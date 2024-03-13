package dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BuyListDto{
	private String pdt_code;
	private String pdt_name;
	private int price;
	private String pay_id; 
	private String pay_name;
	private String pay_type;
	private String pay_key;
	@JsonFormat(shape = Shape.STRING,pattern = "yyyy-MM-dd'T'HH:mm:ssXXX")
	private Timestamp pay_date;
}

enum PayType {
	Kakao, Toss
}