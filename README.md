# Log Data Transformation Module for Terraform

Terraform module for creation of Log Data Transformation triggered by Kinesis Data Stream with Kinesis Firehose as destination

![Kinesis Data Stream -> Lambda -> Kinesis Firehose](doc/images/Data_Stream-Lambda-Firehose.png)

## Feature overview

1. Creates the Lambda Function that performs the log data transformation and forwards the transformed log data to Kinesis Firehose Delivery Stream
1. Creates the Lambda Function trigger from Kinesis Data Stream

## Template Parameters

| Parameter | Description | Mandatory | Allowed values |
| --- | --- | --- | --- |
| Resource Prefix | The prefix for all resources. If empty, auto generated by AWS including the name of the stack. | no | The resource_prefix must be empty or not be longer that 7 characters containing only the following characters: a-z0-9- . |
| Kinesis Delivery Stream ARN | The ARN of an Amazon Kinesis Delivery Stream as destination after transformation. | yes | Must be a valid Kinesis Delivery Stream arn. |
| Kinesis Data Stream ARN | The ARN of an Amazon Kinesis Data Stream as source before transformation. | yes | Must be a valid Kinesis Data Stream arn. |
