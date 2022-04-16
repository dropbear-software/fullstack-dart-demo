import 'dart:convert';

import 'package:todart_api/api_server.dart' show ListTaskListsRequest;
import 'package:grpc/grpc.dart' show GrpcError;

/// See https://google.aip.dev/158 for Pagination Guidance
extension ListTaskListsRequestValidator on ListTaskListsRequest {
  void validate() {
    _validatePageSize();
    _validatePageToken();
  }

  void _validatePageSize() {
    const int defaultPaginationSize = 50;
    const int maximumPaginationSize = 200;

    // If the user does not specify page_size (or specifies 0), the API
    // chooses an appropriate default, which the API should document.
    // The API must not return an error.
    if (pageSize == 0) {
      pageSize = defaultPaginationSize;
      return;
    }

    // If the user specifies page_size greater than the maximum permitted
    // by the API, the API should coerce down to the maximum permitted
    // page size.
    if (pageSize > maximumPaginationSize) {
      pageSize = maximumPaginationSize;
      return;
    }

    // If the user specifies a negative value for page_size, the API must
    // send an INVALID_ARGUMENT error.
    if (pageSize.isNegative) {
      throw GrpcError.invalidArgument('pageSize can not be less than 0');
    }
  }

  // The pageToken should tell us what record in the database to start
  // searching from. We passed that information to them previously assuming
  // the field is not empty, but did so by originally converting a
  // ListTaskListsRequest to binary and then converting it to base64
  // So now we do that process in reverse to figure out the record id
  void _validatePageToken() {
    if (pageToken.isNotEmpty) {
      try {
        final suppliedNextPageToken =
            ListTaskListsRequest.fromBuffer(base64Decode(pageToken));
        pageToken = suppliedNextPageToken.pageToken;
      } catch (e) {
        throw GrpcError.invalidArgument('invalid pageToken provided');
      }
    }
  }
}
