# Building Database Applications - Assignment Report

**Student Name:** Ayush Kumar
**Student Id**: 2024EB01153
**Code URL**  - https://code.xeze.org/cs/student-course-manager
**Live Link** - https://student-course-manager-271230242037.asia-south1.run.app/

---

## 1. Introduction

This report is for the Spring Boot web application assignment. I chose to build an application to manage **Students** and **Courses**. The project does all the required CRUD operations (Create, Read, Update) using Spring MVC, JPA/Hibernate, and JSP for the frontend views. It uses an H2 in-memory database.

---

## 2. Entity Relationship Design

### Entities Used

1. **Student**: Stores student details like name, email, department, and study year.
2. **Course**: Stores course details like course name, course code, department, and credits.

### Relationship

I implemented a **One-to-Many** relationship. One student can take multiple courses, but in this specific design, each course record is assigned to exactly one student.

**Database Tables Structure:**

**Students Table:**

- `id` (Primary Key, Auto Increment)
- `name` (String, Not Null)
- `email` (String, Unique, Not Null)
- `department` (String, Not Null)
- `study_year` (Integer, Not Null)

**Courses Table:**

- `id` (Primary Key, Auto Increment)
- `course_name` (String, Not Null)
- `course_code` (String, Unique, Not Null)
- `department` (String, Not Null)
- `credits` (Integer, Not Null)
- `student_id` (Foreign Key linked to students table)

---

## 3. Implementation Details

I followed the standard Spring Boot architecture. The application is divided into Repository, Service, and Controller layers.

### Entity Classes

**Student Entity:**

```java
// Maps this class to the "students" table in the database
@Entity
@Table(name = "students")
public class Student {

    // Auto-generated primary key
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Student's full name, cannot be empty
    @Column(nullable = false)
    private String name;

    // Email must be unique for each student
    @Column(nullable = false, unique = true)
    private String email;

    // Department the student belongs to
    @Column(nullable = false)
    private String department;

    // The year of study (e.g. 1, 2, 3, 4)
    @Column(name = "study_year", nullable = false)
    private Integer year;

    // One student can have many courses
    // CascadeType.ALL means if a student is deleted, their courses are deleted too
    // FetchType.LAZY means courses are only loaded when we actually need them
    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Course> courses = new ArrayList<>();

    // Getters and setters...
}
```

**Course Entity:**

```java
// Maps this class to the "courses" table in the database
@Entity
@Table(name = "courses")
public class Course {

    // Auto-generated primary key
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Full name of the course
    @Column(nullable = false)
    private String courseName;

    // Unique short code for the course (e.g. CS-101)
    @Column(nullable = false, unique = true)
    private String courseCode;

    // Department this course belongs to
    @Column(nullable = false)
    private String department;

    // Number of credits for this course
    @Column(nullable = false)
    private Integer credits;

    // Many courses can belong to one student
    // student_id is the foreign key column in the courses table
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id", nullable = false)
    private Student student;

    // Getters and setters...
}
```

### Repository Layer (With Custom Inner Join)

I extended `JpaRepository` for both entities. For the specific assignment requirement of doing an Inner Join, I wrote a custom `@Query` in the `CourseRepository`:

```java
// Marks this interface as a Spring Data repository
@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {

    // Spring Data automatically generates the SQL for this — finds a course by its code
    Course findByCourseCode(String courseCode);

    // Custom JPQL query to do an inner join between courses and students
    // JOIN FETCH loads the student data together with the course to avoid LazyInitializationException
    @Query("SELECT c FROM Course c JOIN FETCH c.student")
    List<Course> findAllCoursesWithStudents();
}
```

### Service Layer

I created service classes to handle the business logic and act as a bridge between the controllers and repositories.

**StudentService:**

```java
// Marks this class as a service — handles business logic for students
@Service
public class StudentService {

    // Spring injects the repository automatically
    @Autowired
    private StudentRepository studentRepository;

    // Returns all students from the database
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    // Saves a new student or updates an existing one
    public Student saveStudent(Student student) {
        return studentRepository.save(student);
    }

    // Other CRUD methods...
}
```

**CourseService:**

```java
// Marks this class as a service — handles business logic for courses
@Service
public class CourseService {

    // Spring injects the repository automatically
    @Autowired
    private CourseRepository courseRepository;

    // Returns all courses from the database
    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    // Calls the custom inner join query to get courses along with their student info
    public List<Course> getCoursesWithStudents() {
        return courseRepository.findAllCoursesWithStudents();
    }

    // Other CRUD methods...
}
```

### Controller Layer

I used separate controllers (`StudentController`, `CourseController`, `HomeController`) to handle the routes. Here is an example of how the Create operation is handled for students in `StudentController`, including catching exceptions for duplicate emails:

```java
// Handles POST request when the user submits the add-student form
@PostMapping("/students/add")
public String addStudent(@Valid @ModelAttribute("student") Student student,
                         BindingResult result, RedirectAttributes redirectAttributes) {

    // If the form has validation errors (e.g. empty fields), show the form again
    if (result.hasErrors()) return "student-form";

    try {
        // Try to save the student to the database
        studentService.saveStudent(student);

        // Add a success message that shows up after the redirect
        redirectAttributes.addFlashAttribute("successMessage", "Student added successfully!");

        // Redirect to the students list page
        return "redirect:/students";

    } catch (DataIntegrityViolationException e) {
        // If a student with the same email already exists, show an error on the form
        result.rejectValue("email", "error.student", "A student with this email already exists.");
        return "student-form";
    }
}
```

### Populating the Database

I populated the database with 10 students and 10 courses directly in the main application class using a `CommandLineRunner` bean. It checks if the database is empty and then inserts the sample data using `repository.save()`.

---

## 4. Testing

I wrote unit tests for the repositories using JUnit and `@DataJpaTest`. This tests the database operations without needing to start the full web server.

```java
// Test to verify that the inner join query works correctly
@Test
void testInnerJoin() {

    // Save a new student to the in-memory test database
    Student s2 = studentRepository.save(
        new Student("Diya Patel", "2026998@online.bits-pilani.ac.in", "Computer Science", 2));

    // Save a course linked to that student
    courseRepository.save(new Course("AI", "TEST-402", "Computer Science", 4, s2));

    // Call the custom join query
    List<Course> joined = courseRepository.findAllCoursesWithStudents();

    // Check that we got 2 courses back (1 from setup data + 1 we just added)
    assertEquals(2, joined.size());

    // Make sure each course has a student attached (join worked properly)
    for (Course c : joined) {
        assertNotNull(c.getStudent());
    }
}
```

---

## 5. Challenges Faced

1. **JSP Configuration in Spring Boot:** Getting JSP to render correctly was tricky because modern Spring Boot doesn't support it well out of the box. I had to change the packaging to `WAR` in the `pom.xml` and add the `tomcat-embed-jasper` dependency to make the views load properly.
2. **Handling Unique Constraints:** When a user tried to add a student with an email that already existed, the application crashed with a huge stack trace. I solved this by wrapping the `repository.save()` calls in a try-catch block and specifically catching `DataIntegrityViolationException`, which let me return a nice error message to the JSP form instead.
3. **Lazy Loading Issue:** When I tried to show the student's name in the course list, I got a `LazyInitializationException`. I fixed this by using the `JOIN FETCH` command in my custom JPQL query so it grabs the student data at the same time as the courses.

---

## 6. Screenshots

**1. Home Page**
![[home.png]]
**2. List of Students (Read Operation)**
![[student-form.png]]

**3. Add Student Form (Create Operation)**
![[add-new-student-forum.png]]

**4. Add Course Form (Update Operation)**
![[add-course-forum.png]]

**5. Inner Join View (Courses + Students)**
![[join.png]]

**6. Error Handling (Duplicate Email/Course Code)**
![[error-handlineg.png]]
