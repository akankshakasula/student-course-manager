package com.bookapp;

import com.bookapp.entity.Course;
import com.bookapp.entity.Student;
import com.bookapp.repository.CourseRepository;
import com.bookapp.repository.StudentRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class StudentBookManagerApplication {

    public static void main(String[] args) {
        SpringApplication.run(StudentBookManagerApplication.class, args);
    }

    @Bean
    CommandLineRunner initData(StudentRepository studentRepo, CourseRepository courseRepo) {
        return args -> {
            if (studentRepo.count() > 0) return;

            Student s1 = studentRepo.save(new Student("Ayush Kumar", "2026001@online.bits-pilani.ac.in", "Computer Science", 3));
            Student s2 = studentRepo.save(new Student("Priya Patel", "2026002@online.bits-pilani.ac.in", "Computer Science", 2));
            Student s3 = studentRepo.save(new Student("Rahul Verma", "2026003@online.bits-pilani.ac.in", "Computer Science", 4));
            Student s4 = studentRepo.save(new Student("Sneha Gupta", "2026004@online.bits-pilani.ac.in", "Computer Science", 1));
            Student s5 = studentRepo.save(new Student("Amit Kumar", "2026005@online.bits-pilani.ac.in", "Computer Science", 3));
            Student s6 = studentRepo.save(new Student("Neha Singh", "2026006@online.bits-pilani.ac.in", "Computer Science", 2));
            Student s7 = studentRepo.save(new Student("Vikram Joshi", "2026007@online.bits-pilani.ac.in", "Computer Science", 4));
            Student s8 = studentRepo.save(new Student("Ananya Reddy", "2026008@online.bits-pilani.ac.in", "Computer Science", 1));
            Student s9 = studentRepo.save(new Student("Rohan Mehta", "2026009@online.bits-pilani.ac.in", "Computer Science", 3));
            studentRepo.save(new Student("Kavya Nair", "2026010@online.bits-pilani.ac.in", "Computer Science", 2));

            courseRepo.save(new Course("Data Structures and Algorithms", "CS201", "Computer Science", 4, s1));
            courseRepo.save(new Course("Introduction to Algorithms", "CS301", "Computer Science", 4, s1));
            courseRepo.save(new Course("Computer Networks", "CS302", "Computer Science", 3, s2));
            courseRepo.save(new Course("Software Engineering", "CS303", "Computer Science", 3, s3));
            courseRepo.save(new Course("Java Programming", "CS102", "Computer Science", 3, s4));
            courseRepo.save(new Course("Machine Learning", "CS401", "Computer Science", 4, s5));
            courseRepo.save(new Course("Artificial Intelligence", "CS402", "Computer Science", 4, s6));
            courseRepo.save(new Course("Database System Concepts", "CS304", "Computer Science", 3, s7));
            courseRepo.save(new Course("Operating System Concepts", "CS305", "Computer Science", 4, s8));
            courseRepo.save(new Course("Cloud Computing", "CS403", "Computer Science", 3, s9));
        };
    }
}
