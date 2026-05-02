package com.bookapp.service;

import com.bookapp.entity.Course;
import com.bookapp.entity.Student;
import com.bookapp.repository.CourseRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import java.util.Arrays;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class CourseServiceTest {

    @Mock
    private CourseRepository courseRepository;

    @InjectMocks
    private CourseService courseService;

    private Course course1;

    @BeforeEach
    void setUp() {
        Student student = new Student("Aarav Sharma", "2026999@online.bits-pilani.ac.in", "Computer Science", 3);
        student.setId(1L);
        course1 = new Course("Data Structures", "CS201", "Computer Science", 4, student);
        course1.setId(1L);
    }

    @Test
    void testGetAllCourses() {
        when(courseRepository.findAll()).thenReturn(Arrays.asList(course1));
        List<Course> courses = courseService.getAllCourses();
        assertEquals(1, courses.size());
    }

    @Test
    void testGetCoursesWithStudents() {
        when(courseRepository.findAllCoursesWithStudents()).thenReturn(Arrays.asList(course1));
        List<Course> courses = courseService.getCoursesWithStudents();
        assertEquals(1, courses.size());
    }

    @Test
    void testSaveCourse() {
        when(courseRepository.save(any(Course.class))).thenReturn(course1);
        Course saved = courseService.saveCourse(course1);
        assertNotNull(saved);
        assertEquals("Data Structures", saved.getCourseName());
    }
}
