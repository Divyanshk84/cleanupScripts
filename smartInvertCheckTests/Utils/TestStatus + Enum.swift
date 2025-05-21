import Foundation

enum TestStatus: String{
    case TestSuccess = "LAMBDA_EXECUTE_TEST_SUCCEEDED"
    case TestFailed = "LAMBDA_EXECUTE_TEST_FAILED" // When we have to mark the device faulty
    case TestStarted = "LAMBDA_EXECUTE_TEST_STARTED"
    case TestInfo = "LAMBDA_EXECUTE_TEST_INFO" // When we don't have to mark the device faulty
}
