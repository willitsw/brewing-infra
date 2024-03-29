# LAMBDA FUNCTIONS ##########################

module "recipe_get_by_id_lambda" {
  # Edit these
  function_name = "RecipeGetById"
  gateway_route = "GET /recipes/{id}"

  # These shouldn't change probably
  source = "./modules/lambda-with-gateway"
  iam_role = aws_iam_role.lambda_exec.arn
  s3_bucket_id = aws_s3_bucket.lambda_bucket.id
  api_id = aws_apigatewayv2_api.lambda.id
  api_execution_arn = aws_apigatewayv2_api.lambda.execution_arn
  lambda_tags = {
    Project = var.project_tag
    Environment = var.prod_env_tag
  }
}

module "recipe_get_by_user_lambda" {
  # Edit these
  function_name = "RecipeGetByUser"
  gateway_route = "GET /recipes"

  # These shouldn't change probably
  source = "./modules/lambda-with-gateway"
  iam_role = aws_iam_role.lambda_exec.arn
  s3_bucket_id = aws_s3_bucket.lambda_bucket.id
  api_id = aws_apigatewayv2_api.lambda.id
  api_execution_arn = aws_apigatewayv2_api.lambda.execution_arn
  lambda_tags = {
    Project = var.project_tag
    Environment = var.prod_env_tag
  }
}

module "recipe_create_update_lambda" {
  # Edit these
  function_name = "RecipeCreateUpdate"
  gateway_route = "POST /recipes"

  # These shouldn't change probably
  source = "./modules/lambda-with-gateway"
  iam_role = aws_iam_role.lambda_exec.arn
  s3_bucket_id = aws_s3_bucket.lambda_bucket.id
  api_id = aws_apigatewayv2_api.lambda.id
  api_execution_arn = aws_apigatewayv2_api.lambda.execution_arn
  lambda_tags = {
    Project = var.project_tag
    Environment = var.prod_env_tag
  }
}

module "recipe_delete_lambda" {
  # Edit these
  function_name = "RecipeDelete"
  gateway_route = "DELETE /recipes/{id}"

  # These shouldn't change probably
  source = "./modules/lambda-with-gateway"
  iam_role = aws_iam_role.lambda_exec.arn
  s3_bucket_id = aws_s3_bucket.lambda_bucket.id
  api_id = aws_apigatewayv2_api.lambda.id
  api_execution_arn = aws_apigatewayv2_api.lambda.execution_arn
  lambda_tags = {
    Project = var.project_tag
    Environment = var.prod_env_tag
  }
}

############# USER

module "user_get_lambda" {
  # Edit these
  function_name = "UserGet"
  gateway_route = "GET /users"

  # These shouldn't change probably
  source = "./modules/lambda-with-gateway"
  iam_role = aws_iam_role.lambda_exec.arn
  s3_bucket_id = aws_s3_bucket.lambda_bucket.id
  api_id = aws_apigatewayv2_api.lambda.id
  api_execution_arn = aws_apigatewayv2_api.lambda.execution_arn
  lambda_tags = {
    Project = var.project_tag
    Environment = var.prod_env_tag
  }
}

module "user_create_update_lambda" {
  # Edit these
  function_name = "UserCreateUpdate"
  gateway_route = "POST /users"

  # These shouldn't change probably
  source = "./modules/lambda-with-gateway"
  iam_role = aws_iam_role.lambda_exec.arn
  s3_bucket_id = aws_s3_bucket.lambda_bucket.id
  api_id = aws_apigatewayv2_api.lambda.id
  api_execution_arn = aws_apigatewayv2_api.lambda.execution_arn
  lambda_tags = {
    Project = var.project_tag
    Environment = var.prod_env_tag
  }
}