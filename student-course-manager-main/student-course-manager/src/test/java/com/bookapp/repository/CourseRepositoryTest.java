package com.bookapp.repository;

import com.bookapp.entity.Course;
import com.bookapp.entity.Student;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import java.util.List;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
class CourseRepositoryTest {

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private StudentRepository studentRepository;

    private Student testStudent;
    private Course testCourse;

    @BeforeEach
    void setUp() {
        courseRepository.deleteAll();
        studentRepository.deleteAll();
        testStudent = studentRepository.save(
            new Student("Aarav Sharma", "2026999@online.bits-pilani.ac.in", "Computer Science", 3));
        testCourse = courseRepository.save(
            new Course("Data Structures", "TEST-201", "Computer Science", 4, testStudent));
    }

    @Test
    void testSaveCourse() {
        Course c = courseRepository.save(
            new Course("Algorithms", "TEST-301", "Computer Science", 4, testStudent));
        assertNotNull(c.getId());
        assertEquals("Algorithms", c.getCourseName());
    }

    @Test
    void testFindAll() {
        courseRepository.save(new Course("Algorithms", "TEST-301", "Computer Science", 4, testStudent));
        List<Course> courses = courseRepository.findAll();
        assertEquals(2, courses.size());
    }

    @Test
    void testFindById() {
        Optional<Course> found = courseRepository.findById(testCourse.getId());
        assertTrue(found.isPresent());
        assertEquals("Data Structures", found.get().getCourseName());
    }

    @Test
    void testFindByCourseCode() {
        Course found = courseRepository.findByCourseCode("TEST-201");
        assertNotNull(found);
        assertEquals("Data Structures", found.getCourseName());
    }

    @Test
    void testInnerJoin() {
        Student s2 = studentRepository.save(
            new Student("Diya Patel", "2026998@online.bits-pilani.ac.in", "Computer Science", 2));
        courseRepository.save(new Course("AI", "TEST-402", "Computer Science", 4, s2));
        List<Course> joined = courseRepository.findAllCoursesWithStudents();
        assertEquals(2, joined.size());
        for (Course c : joined) {
            assertNotNull(c.getStudent());
        }
    }

    @Test
    void testUpdate() {
        testCourse.setCourseName("Advanced DS");
        testCourse.setCredits(5);
        Course updated = courseRepository.save(testCourse);
        assertEquals("Advanced DS", updated.getCourseName());
        assertEquals(5, updated.getCredits());
    }
}
