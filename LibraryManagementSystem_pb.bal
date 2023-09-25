import ballerina/grpc;
import ballerina/protobuf;
import ballerina/protobuf.types.wrappers;

public const string LIBRARYMANAGEMENTSYSTEM_DESC = "0A1D4C6962726172794D616E6167656D656E7453797374656D2E70726F746F121E4C6962726172794D616E6167656D656E7453797374656D7061636B6167651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F228B010A07416464426F6F6B12140A057469746C6518012001280952057469746C6512160A06617574686F721802200128095206617574686F7212120A044953424E18032001280352044953424E121A0A086C6F636174696F6E18042001280952086C6F636174696F6E12220A0C617661696C6162696C697479180520012809520C617661696C6162696C697479224E0A0455736572121A0A08757365724E616D651801200128095208757365724E616D65120E0A02696418022001280352026964121A0A0870617373636F6465180320012803520870617373636F6465228F010A0B5570646174655F426F6F6B12140A057469746C6518012001280952057469746C6512160A06617574686F721802200128095206617574686F7212120A044953424E18032001280352044953424E121A0A086C6F636174696F6E18042001280952086C6F636174696F6E12220A0C617661696C6162696C697479180520012809520C617661696C6162696C69747922200A0A52656D6F7665426F6F6B12120A044953424E18012001280352044953424E2298010A144C6973744F66417661696C61626C65426F6F6B7312140A057469746C6518012001280952057469746C6512160A06617574686F721802200128095206617574686F7212120A044953424E18032001280352044953424E121A0A086C6F636174696F6E18042001280952086C6F636174696F6E12220A0C617661696C6162696C697479180520012809520C617661696C6162696C697479223B0A0B4C6F636174655F426F6F6B12120A044953424E18012001280352044953424E12180A076C6F6374696F6E18022001280952076C6F6374696F6E22620A0A426F72726F77426F6F6B12120A044953424E18012001280352044953424E12140A057469746C6518022001280952057469746C65121A0A086C6F636174696F6E18032001280952086C6F636174696F6E120E0A026964180420012803520269643292050A174C6962726172794D616E6167656D656E7453797374656D125B0A07616464626F6F6B12272E4C6962726172794D616E6167656D656E7453797374656D7061636B6167652E416464426F6F6B1A272E4C6962726172794D616E6167656D656E7453797374656D7061636B6167652E416464426F6F6B124A0A047573657212242E4C6962726172794D616E6167656D656E7453797374656D7061636B6167652E557365721A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512580A0B7570646174655F626F6F6B122B2E4C6962726172794D616E6167656D656E7453797374656D7061636B6167652E5570646174655F426F6F6B1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512560A0A72656D6F7665626F6F6B122A2E4C6962726172794D616E6167656D656E7453797374656D7061636B6167652E52656D6F7665426F6F6B1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565126A0A146C6973746F66617661696C61626C65626F6F6B7312342E4C6962726172794D616E6167656D656E7453797374656D7061636B6167652E4C6973744F66417661696C61626C65426F6F6B731A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512580A0B6C6F636174655F626F6F6B122B2E4C6962726172794D616E6167656D656E7453797374656D7061636B6167652E4C6F636174655F426F6F6B1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512560A0A626F72726F77626F6F6B122A2E4C6962726172794D616E6167656D656E7453797374656D7061636B6167652E426F72726F77426F6F6B1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33";

public isolated client class LibraryManagementSystemClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, LIBRARYMANAGEMENTSYSTEM_DESC);
    }

    isolated remote function addbook(AddBook|ContextAddBook req) returns AddBook|grpc:Error {
        map<string|string[]> headers = {};
        AddBook message;
        if req is ContextAddBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/addbook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <AddBook>result;
    }

    isolated remote function addbookContext(AddBook|ContextAddBook req) returns ContextAddBook|grpc:Error {
        map<string|string[]> headers = {};
        AddBook message;
        if req is ContextAddBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/addbook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <AddBook>result, headers: respHeaders};
    }

    isolated remote function user(User|ContextUser req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        User message;
        if req is ContextUser {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/user", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function userContext(User|ContextUser req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        User message;
        if req is ContextUser {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/user", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function update_book(Update_Book|ContextUpdate_Book req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        Update_Book message;
        if req is ContextUpdate_Book {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/update_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function update_bookContext(Update_Book|ContextUpdate_Book req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        Update_Book message;
        if req is ContextUpdate_Book {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/update_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function removebook(RemoveBook|ContextRemoveBook req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        RemoveBook message;
        if req is ContextRemoveBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/removebook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function removebookContext(RemoveBook|ContextRemoveBook req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        RemoveBook message;
        if req is ContextRemoveBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/removebook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function listofavailablebooks(ListOfAvailableBooks|ContextListOfAvailableBooks req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        ListOfAvailableBooks message;
        if req is ContextListOfAvailableBooks {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/listofavailablebooks", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function listofavailablebooksContext(ListOfAvailableBooks|ContextListOfAvailableBooks req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        ListOfAvailableBooks message;
        if req is ContextListOfAvailableBooks {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/listofavailablebooks", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function locate_book(Locate_Book|ContextLocate_Book req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        Locate_Book message;
        if req is ContextLocate_Book {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/locate_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function locate_bookContext(Locate_Book|ContextLocate_Book req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        Locate_Book message;
        if req is ContextLocate_Book {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/locate_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function borrowbook(BorrowBook|ContextBorrowBook req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBook message;
        if req is ContextBorrowBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/borrowbook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function borrowbookContext(BorrowBook|ContextBorrowBook req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBook message;
        if req is ContextBorrowBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagementSystempackage.LibraryManagementSystem/borrowbook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }
}

public client class LibraryManagementSystemAddBookCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendAddBook(AddBook response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextAddBook(ContextAddBook response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryManagementSystemStringCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendString(string response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextString(wrappers:ContextString response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextAddBook record {|
    AddBook content;
    map<string|string[]> headers;
|};

public type ContextBorrowBook record {|
    BorrowBook content;
    map<string|string[]> headers;
|};

public type ContextUser record {|
    User content;
    map<string|string[]> headers;
|};

public type ContextListOfAvailableBooks record {|
    ListOfAvailableBooks content;
    map<string|string[]> headers;
|};

public type ContextRemoveBook record {|
    RemoveBook content;
    map<string|string[]> headers;
|};

public type ContextLocate_Book record {|
    Locate_Book content;
    map<string|string[]> headers;
|};

public type ContextUpdate_Book record {|
    Update_Book content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: LIBRARYMANAGEMENTSYSTEM_DESC}
public type AddBook record {|
    string title = "";
    string author = "";
    int ISBN = 0;
    string location = "";
    string availability = "";
|};

@protobuf:Descriptor {value: LIBRARYMANAGEMENTSYSTEM_DESC}
public type BorrowBook record {|
    int ISBN = 0;
    string title = "";
    string location = "";
    int id = 0;
|};

@protobuf:Descriptor {value: LIBRARYMANAGEMENTSYSTEM_DESC}
public type User record {|
    string userName = "";
    int id = 0;
    int passcode = 0;
|};

@protobuf:Descriptor {value: LIBRARYMANAGEMENTSYSTEM_DESC}
public type ListOfAvailableBooks record {|
    string title = "";
    string author = "";
    int ISBN = 0;
    string location = "";
    string availability = "";
|};

@protobuf:Descriptor {value: LIBRARYMANAGEMENTSYSTEM_DESC}
public type RemoveBook record {|
    int ISBN = 0;
|};

@protobuf:Descriptor {value: LIBRARYMANAGEMENTSYSTEM_DESC}
public type Locate_Book record {|
    int ISBN = 0;
    string loction = "";
|};

@protobuf:Descriptor {value: LIBRARYMANAGEMENTSYSTEM_DESC}
public type Update_Book record {|
    string title = "";
    string author = "";
    int ISBN = 0;
    string location = "";
    string availability = "";
|};

