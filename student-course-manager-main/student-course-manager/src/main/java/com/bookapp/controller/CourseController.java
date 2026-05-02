package com.bookapp.controller;

import com.bookapp.entity.Course;
import com.bookapp.service.CourseService;
import com.bookapp.service.StudentService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/courses")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private StudentService studentService;

    @GetMapping
    public String listCourses(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        return "course-list";
    }

    @GetMapping("/joined")
    public String listJoinedData(Model model) {
        model.addAttribute("courses", courseService.getCoursesWithStudents());
        return "course-joined";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("course", new Course());
        model.addAttribute("students", studentService.getAllStudents());
        return "course-form";
    }

    @PostMapping("/add")
    public String addCourse(@Valid @ModelAttribute("course") Course course,
                            BindingResult result,
                            Model model,
                            RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            model.addAttribute("students", studentService.getAllStudents());
            return "course-form";
        }
        try {
            courseService.saveCourse(course);
            redirectAttributes.addFlashAttribute("successMessage", "Course added successfully!");
            return "redirect:/courses";
        } catch (DataIntegrityViolationException e) {
            result.rejectValue("courseCode", "error.course", "A course with this code already exists.");
            model.addAttribute("students", studentService.getAllStudents());
            return "course-form";
        }
    }
}
