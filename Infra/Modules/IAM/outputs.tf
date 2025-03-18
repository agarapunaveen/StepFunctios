output "lambda_role" {
  value = aws_iam_role.lambda_role.arn
}
output "step_role" {
  value = aws_iam_role.step_functions_role.arn
}