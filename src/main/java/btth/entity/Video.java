package btth.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Video")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Video {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, length = 255)
    private String title;   // tên video

    @Column(nullable = false, length = 500)
    private String url;     // link video (YouTube hoặc file)

    private boolean status = true; // true = active, false = inactive

    // Liên kết với User (ai thêm video)
    @ManyToOne
    @JoinColumn(name = "userid", nullable = false)
    private Users user;

}
