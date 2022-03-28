class ApiResponse<T> {
  Status? status;
  T? responseData;
  String? message;

  ApiResponse.loading(this.message) : status = Status.loading;

  ApiResponse.completed(this.responseData) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $responseData";
  }
}

enum Status { loading, completed, error }
