package com.bookapp.repository;

import com.bookapp.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {

    Course findByCourseCode(String courseCode);

    @Query("SELECT c FROM Course c JOIN FETCH c.student")
    List<Course> findAllCoursesWithStudents();
}
