package dto;

import java.sql.Timestamp;

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
public class NoticeDto {
	private long idx;
	private String title;
	private String contents;
	private int read_cnt;
	private String att_file;
	private String up_file;
	private Timestamp crt_date;
}
