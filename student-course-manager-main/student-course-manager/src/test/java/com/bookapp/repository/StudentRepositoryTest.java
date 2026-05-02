package com.bookapp.repository;

import com.bookapp.entity.Student;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import java.util.List;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
class StudentRepositoryTest {

    @Autowired
    private StudentRepository studentRepository;

    private Student testStudent;

    @BeforeEach
    void setUp() {
        studentRepository.deleteAll();
        testStudent = studentRepository.save(
            new Student("Aarav Sharma", "2026999@online.bits-pilani.ac.in", "Computer Science", 3));
    }

    @Test
    void testSaveStudent() {
        Student s = studentRepository.save(
            new Student("Diya Patel", "2026998@online.bits-pilani.ac.in", "Computer Science", 2));
        assertNotNull(s.getId());
        assertEquals("Diya Patel", s.getName());
    }

    @Test
    void testFindAll() {
        studentRepository.save(
            new Student("Diya Patel", "2026998@online.bits-pilani.ac.in", "Computer Science", 2));
        List<Student> students = studentRepository.findAll();
        assertEquals(2, students.size());
    }

    @Test
    void testFindById() {
        Optional<Student> found = studentRepository.findById(testStudent.getId());
        assertTrue(found.isPresent());
        assertEquals("Aarav Sharma", found.get().getName());
    }

    @Test
    void testFindByEmail() {
        Student found = studentRepository.findByEmail("2026999@online.bits-pilani.ac.in");
        assertNotNull(found);
        assertEquals("Aarav Sharma", found.getName());
    }

    @Test
    void testUpdate() {
        testStudent.setName("Aarav Updated");
        Student updated = studentRepository.save(testStudent);
        assertEquals("Aarav Updated", updated.getName());
    }
}
