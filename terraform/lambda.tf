data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file  = "${path.module}/src/index.py"
  output_path = "${path.module}/src/rolodex_report_lambda.zip"
}

resource "aws_s3_object" "lambda_code" {
  bucket      = aws_s3_bucket.project_resources.id
  key         = "src/rolodex_report_lambda.zip"
  source      = data.archive_file.lambda_zip.output_path
  source_hash = data.archive_file.lambda_zip.output_base64sha256
}

resource "aws_lambda_function" "rolodex" {
  s3_bucket        = aws_s3_bucket.project_resources.id
  s3_key           = "src/rolodex_report_lambda.zip"
  function_name    = "rolodex_report"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "index.lambda_handler"
  runtime          = "python3.11"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = {
      ENVIRONMENT = "${var.environment}"
      LOG_LEVEL   = "info"
    }
  }
}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.rolodex.function_name}"
  retention_in_days = 3
}
