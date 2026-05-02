package com.bookapp.service;

import com.bookapp.entity.Course;
import com.bookapp.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CourseService {

    @Autowired
    private CourseRepository courseRepository;

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public List<Course> getCoursesWithStudents() {
        return courseRepository.findAllCoursesWithStudents();
    }

    public Course saveCourse(Course course) {
        return courseRepository.save(course);
    }
}
