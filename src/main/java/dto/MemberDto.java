package dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@JsonIgnoreProperties(ignoreUnknown = true)

public class MemberDto {
	private String id;
	@Setter
	private String password;
	private String name;
	private String birth;
	private String gender;
	private String phonenum;
	private String email;
	private String add_state;
	private String add_city;
	private String add_dong;
	private String add_details;
	private String postalCode;
	private String favorites;
	private Timestamp reg_date;
}
