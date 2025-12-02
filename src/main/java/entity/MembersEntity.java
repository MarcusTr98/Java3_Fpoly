package entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MembersEntity {
	private int id;
	private String fullName, email;
	private int age;
	private boolean gender;

	public MembersEntity(String fullName, String email, int age, boolean gender) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.age = age;
		this.gender = gender;
	}

}
