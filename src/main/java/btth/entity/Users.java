package btth.entity;

import java.util.List;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "Users")
public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	@Column(nullable = false, unique = true)
	String username;

	@Column(nullable = false)
	String password;

	@Column(nullable = false)
	int role; // 0 - user,1 - manager, 2 - admin
	@Column(nullable = false)
	String fullname;

	@Column(nullable = false, unique = true)
	String email;

	@Column(nullable = false, unique = true)
	String phone;

	@Column(nullable = false)
	boolean status;
	
	@OneToMany(mappedBy = "user")
	private List<Category> categories;


}
