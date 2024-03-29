resource "aws_lambda_function" "function" {
  function_name = var.function_name

  s3_bucket = var.s3_bucket_id
  s3_key    = "${var.function_name}.zip"

  runtime = "nodejs14.x"
  handler = "${var.function_name}.handler"

  role = var.iam_role
  # vpc_config {
  #   subnet_ids         = ["subnet-2db26550", "subnet-2efec162", "subnet-80039deb"]
  #   security_group_ids = ["sg-057d16d6e7c5f91c7"]
  # }
  environment {
    variables = {
      environment = "production"
    }
  }

  tags = var.lambda_tags
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "/aws/lambda/${aws_lambda_function.function.function_name}"

  retention_in_days = 30
  tags = var.lambda_tags
}

resource "aws_apigatewayv2_integration" "apigateway_integration" {
  api_id = var.api_id

  integration_uri    = aws_lambda_function.function.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "route" {
  api_id = var.api_id

  route_key = var.gateway_route
  target    = "integrations/${aws_apigatewayv2_integration.apigateway_integration.id}"
}

resource "aws_lambda_permission" "permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${var.api_execution_arn}/*/*"
}

# resource "aws_lambda_provisioned_concurrency_config" "function_concurrency" {
#   function_name                     = aws_lambda_function.function.function_name
#   provisioned_concurrent_executions = 5
#   qualifier                         = aws_lambda_function.function.version
# }