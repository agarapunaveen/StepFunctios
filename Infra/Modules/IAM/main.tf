# Create IAM Role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = "LambdaExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# Attach a Policy to the Lambda Role
resource "aws_iam_policy_attachment" "lambda_policy" {
  name       = "lambda-basic-policy"
  roles      = [aws_iam_role.lambda_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


# IAM Role for Step Functions
resource "aws_iam_role" "step_functions_role" {
  name = "StepFunctionsExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "states.amazonaws.com"
      }
    }]
  })
}

# Attach IAM Policy to Step Functions Role
resource "aws_iam_policy_attachment" "step_functions_policy" {
  name       = "step-functions-lambda-policy"
  roles      = [aws_iam_role.step_functions_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaRole"
}