import ballerina/http;

public function main() {
    http:Client clientEndpoint = new ("http://localhost:8080/faculty");

    // Add a new lecturer
    json newLecturer = {
        "staffNumber": "101",
        "officeNumber": "A01",
        "staffName": "Peter Nambala",
        "title": "Professor",
        "courses": [
            {
                "courseName": "Software Processes",
                "courseCode": "SP101",
                "nqfLevel": "8"
            }
        ]
    };
    var addResponse = clientEndpoint->post("/lecturers", newLecturer);
    io:println(addResponse);

    // Retrieve a list of all lecturers
    var getAllResponse = clientEndpoint->get("/lecturers");
    io:println(getAllResponse);

    // Retrieve the details of a specific lecturer by staff number
    var getOneResponse = clientEndpoint->get("/lecturers/101");
    io:println(getOneResponse);

    // Update an existing lecturer's information
    var updateLecturer = {
        "staffNumber": "101",
        "officeNumber": "B202",
        "staffName": "Updated Peter Nambala",
        "title": "Associate Professor",
        "courses": [
            {
                "courseName": "Programming1",
                "courseCode": "PR101",
                "nqfLevel": "6"
            }
        ]
    };
    var updateResponse = clientEndpoint->put("/lecturers/101", updateLecturer);
    io:println(updateResponse);

    // Retrieve all lecturers that teach a certain course
    var getCourseLecturersResponse = clientEndpoint->get("/lecturers/courses/SP101");
    io:println(getCourseLecturersResponse);

    // Retrieve all lecturers that sit in the same office
    var getOfficeLecturersResponse = clientEndpoint->get("/lecturers/offices"A01");
    io:println(getOfficeLecturersResponse);
}
