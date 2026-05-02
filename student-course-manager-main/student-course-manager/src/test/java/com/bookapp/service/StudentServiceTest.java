package com.bookapp.service;

import com.bookapp.entity.Student;
import com.bookapp.repository.StudentRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class StudentServiceTest {

    @Mock
    private StudentRepository studentRepository;

    @InjectMocks
    private StudentService studentService;

    private Student student1;

    @BeforeEach
    void setUp() {
        student1 = new Student("Aarav Sharma", "2026998@online.bits-pilani.ac.in", "Computer Science", 3);
        student1.setId(1L);
    }

    @Test
    void testGetAllStudents() {
        when(studentRepository.findAll()).thenReturn(Arrays.asList(student1));
        List<Student> students = studentService.getAllStudents();
        assertEquals(1, students.size());
        verify(studentRepository, times(1)).findAll();
    }

    @Test
    void testGetStudentById() {
        when(studentRepository.findById(1L)).thenReturn(Optional.of(student1));
        Student found = studentService.getStudentById(1L);
        assertNotNull(found);
        assertEquals("Aarav Sharma", found.getName());
    }

    @Test
    void testSaveStudent() {
        when(studentRepository.save(any(Student.class))).thenReturn(student1);
        Student saved = studentService.saveStudent(student1);
        assertNotNull(saved);
        verify(studentRepository, times(1)).save(student1);
    }

    @Test
    void testUpdateStudent() {
        when(studentRepository.findById(1L)).thenReturn(Optional.of(student1));
        when(studentRepository.save(any(Student.class))).thenReturn(student1);
        Student updatedData = new Student("Aarav Updated", "2026998@online.bits-pilani.ac.in", "Computer Science", 4);
        Student result = studentService.updateStudent(1L, updatedData);
        assertNotNull(result);
        assertEquals("Aarav Updated", student1.getName());
    }
}
