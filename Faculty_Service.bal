import ballerina/http;

// Define a record type 'Lecturer' to represent lecturer information
type Lecturer record {
    string staffNumber;
    string officeNumber;
    string staffName;
    string title;
    Course[] courses;
};

// Define a record type 'Course' to represent course information
type Course record {
    string courseName;
    string courseCode;
    string nqfLevel;
};

// Create a map to store lecturer records with staff numbers as keys
map<string, Lecturer> lecturers = {};

// Define a Ballerina service named '/faculty' that listens on port 8080
service /faculty on new http:Listener(8080) {
    
    // Define a resource function to retrieve all lecturers
    resource function get getLecturers() returns json {
        return lecturers;
    }

    // Define a resource function to add a new lecturer
    resource function post addLecturer(http:Request request, json payload) returns json {
        Lecturer lecturer = check <Lecturer>payload;
        lecturers[lecturer.staffNumber] = lecturer;
        http:Created created = {};
        created.setPayload(lecturer);
        return created;
    }

    // Define a resource function to retrieve a specific lecturer by staff number
    resource function get getLecturerByStaffNumber(string staffNumber) returns json {
        Lecturer? lecturer = lecturers[staffNumber];
        if (lecturer == ()) {
            http:NotFound notFound = {};
            return notFound;
        }
        return lecturer;
    }

    // Define a resource function to update an existing lecturer's information
    resource function put updateLecturer(string staffNumber, http:Request request, json payload) returns json {
        Lecturer? existingLecturer = lecturers[staffNumber];
        if (existingLecturer == ()) {
            http:NotFound notFound = {};
            return notFound;
        }
        Lecturer newLecturer = check <Lecturer>payload;
        lecturers[staffNumber] = newLecturer;
        return newLecturer;
    }

    // Define a resource function to delete a lecturer by staff number
    resource function delete deleteLecturer(string staffNumber) returns json {
        Lecturer? lecturer = lecturers[staffNumber];
        if (lecturer == ()) {
            http:NotFound notFound = {};
            return notFound;
        }
        lecturers.delete(staffNumber);
        http:NoContent noContent = {};
        return noContent;
    }

    // Define a resource function to get lecturers who teach a certain course
    resource function get getLecturersByCourseCode(string courseCode) returns json {
        json[] lecturersList = [];
        foreach lecturer in lecturers {
            if (containsCourse(lecturer, courseCode)) {
                lecturersList.push(lecturer);
            }
        }
        return lecturersList;
    }

    // Define a resource function to get lecturers who sit in the same office
    resource function get getLecturersByOfficeNumber(string officeNumber) returns json {
        json[] lecturersList = [];
        foreach lecturer in lecturers {
            if (lecturer.officeNumber == officeNumber) {
                lecturersList.push(lecturer);
            }
        }
        return lecturersList;
    }
}

// Function to check if a lecturer teaches a certain course
function containsCourse(Lecturer lecturer, string courseCode) returns boolean {
    foreach (Course course in lecturer.courses) {
        if (course.courseCode == courseCode) {
            return true;
        }
    }
    return false;
}

// Main function to start the HTTP listener on port 8080
function main() {
    http:Listener listener = new(8080);
    check listener.start();
}
