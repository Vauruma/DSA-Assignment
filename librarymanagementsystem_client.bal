import ballerina/io;

LibraryManagementSystemClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    AddBook addbookRequest = {title: "ballerina", author: "ballerina", ISBN: 1, location: "ballerina", availability: "ballerina"};
    AddBook addbookResponse = check ep->addbook(addbookRequest);
    io:println(addbookResponse);

    User userRequest = {userName: "ballerina", id: 1, passcode: 1};
    string userResponse = check ep->user(userRequest);
    io:println(userResponse);

    Update_Book update_bookRequest = {title: "ballerina", author: "ballerina", ISBN: 1, location: "ballerina", availability: "ballerina"};
    string update_bookResponse = check ep->update_book(update_bookRequest);
    io:println(update_bookResponse);

    RemoveBook removebookRequest = {ISBN: 1};
    string removebookResponse = check ep->removebook(removebookRequest);
    io:println(removebookResponse);

    ListOfAvailableBooks listofavailablebooksRequest = {title: "ballerina", author: "ballerina", ISBN: 1, location: "ballerina", availability: "ballerina"};
    string listofavailablebooksResponse = check ep->listofavailablebooks(listofavailablebooksRequest);
    io:println(listofavailablebooksResponse);

    Locate_Book locate_bookRequest = {ISBN: 1, loction: "ballerina"};
    string locate_bookResponse = check ep->locate_book(locate_bookRequest);
    io:println(locate_bookResponse);

    BorrowBook borrowbookRequest = {ISBN: 1, title: "ballerina", location: "ballerina", id: 1};
    string borrowbookResponse = check ep->borrowbook(borrowbookRequest);
    io:println(borrowbookResponse);
}

