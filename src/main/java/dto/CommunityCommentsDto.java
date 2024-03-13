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
public class CommunityCommentsDto {
	private int idx;
	private int self_idx;
	private long mref;
	private String comment_id;
	private String contents;
	private int heart_cnt;
	private Timestamp crt_date;
}
