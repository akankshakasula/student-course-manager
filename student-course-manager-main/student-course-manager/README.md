# Student & Course Manager 🎓

A robust Spring Boot application designed to manage student enrollments and course assignments. Built with a focus on clean MVC architecture and persistent data management.

## 🚀 Features

- **Student Management:** Create, Read, and Update student profiles.
- **Course Enrollment:** Assign students to specific courses with validation.
- **Dynamic Views:** Responsive JSP-based interface with custom CSS.
- **Data Integrity:** Server-side validation and JPA-managed relationships.

## 🛠️ Tech Stack

- **Backend:** Java 17, Spring Boot 3.2.5
- **Persistence:** Spring Data JPA, Hibernate
- **Database:** H2 (In-memory)
- **Frontend:** JSP, JSTL, CSS3
- **Build Tool:** Maven

## 📊 Architecture

### System Flow (MVC)

```mermaid
graph LR
    User((User)) -->|HTTP Request| Controller[Spring MVC Controller]
    Controller -->|Calls| Service[Business Service Layer]
    Service -->|Uses| Repo[JPA Repository]
    Repo <-->|Query| DB[(H2 Database)]
    Service -->|Returns Data| Controller
    Controller -->|Binds Model| JSP[JSP View]
    JSP -->|HTML Response| User
```

### Entity Relationship

```mermaid
erDiagram
    STUDENT ||--o{ COURSE : "enrolled in"
    STUDENT {
        long id PK
        string name
        string email
        string department
        int year
    }
    COURSE {
        long id PK
        string courseName
        string courseCode
        string department
        int credits
        long student_id FK
    }
```

## 🏁 How to Run

1. **Clone the repository:**

   ```bash
   git clone https://code.xeze.org/cs/student-course-manager
   ```
2. **Run with Maven:**

   ```bash
   mvn spring-boot:run
   ```
3. **Access the application:**

   - Home Page: `http://localhost:8080`
   - H2 Console: `http://localhost:8080/h2-console` (JDBC URL: `jdbc:h2:mem:testdb`)

---

Built for building-database-applications.
