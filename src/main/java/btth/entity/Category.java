package btth.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "Category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, unique = true, length = 100)
    private String name;

    // Quan hệ: mỗi Category thuộc về 1 User (manager tạo ra)
    @ManyToOne
    @JoinColumn(name = "userid", nullable = false)
    private Users user;

    @Column(nullable = false, length = 200)
    private String img;   // tên file ảnh hoặc đường dẫn ảnh

    @Column(nullable = false)
    private boolean status;  // true = active, false = inactive
}
