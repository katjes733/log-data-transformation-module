# MIT License
#
# Copyright (c) 2022 Martin Macecek
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

variable "resource_prefix" {
    description = "The prefix for all resources. If empty, uniquness of resource names is ensured."
    type        = string
    default     = "mac-"

    validation {
        condition     = can(regex("^$|^[a-z0-9-]{0,7}$", var.resource_prefix))
        error_message = "The resource_prefix must be empty or not be longer that 7 characters containing only the following characters: a-z0-9- ."
    }
}

variable "kinesis_delivery_stream_arn" {
    description = "The ARN of an Amazon Kinesis Delivery Stream as destination after transformation."
    type        = string

    validation {
        condition     = can(regex("^arn:aws:firehose:[a-z]{2}-(?:gov-){0,1}(?:north|northeast|east|southeast|south|southwest|west|northwest|central)-[1-9]{1}:\\d{12}:deliverystream\\/.+$", var.kinesis_delivery_stream_arn))
        error_message = "Must be a valid Kinesis Delivery Stream ARN."
    }
}

variable "kinesis_data_stream_arn" {
    description = "The ARN of an Amazon Kinesis Data Stream as source before transformation."
    type        = string

    validation {
        condition     = can(regex("^arn:aws:kinesis:[a-z]{2}-(?:gov-){0,1}(?:north|northeast|east|southeast|south|southwest|west|northwest|central)-[1-9]{1}:\\d{12}:stream\\/.+$", var.kinesis_data_stream_arn))
        error_message = "Must be a valid Kinesis Data Stream ARN."
    }
}