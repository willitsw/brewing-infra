resource "aws_dynamodb_table" "recipe_table" {
  name             = "recipes"
  hash_key         = "id"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
      name = "userId"
      type = "S"
  }

  global_secondary_index {
    name               = "userIndex"
    hash_key           = "userId"
    write_capacity     = 5
    read_capacity      = 5
    projection_type    = "INCLUDE"
    non_key_attributes = [
      "name",
      "author",
      "type",
      "createdDate",
      "updatedDate",
      "measurementType",
      "batchSize",
      "efficiency",
    ]
  }

  tags = {
    Project = var.project_tag
    Environment = var.prod_env_tag
  }
}

resource "aws_dynamodb_table" "user_table" {
  name             = "users"
  hash_key         = "id"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Project = var.project_tag
    Environment = var.prod_env_tag
  }
}