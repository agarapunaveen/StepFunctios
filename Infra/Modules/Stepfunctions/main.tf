# Define the Step Function State Machine
resource "aws_sfn_state_machine" "example" {
  name     = "MyStepFunction"
  role_arn = var.step_role

  definition = jsonencode({
    Comment = "A simple Step Function example"
    StartAt = "InvokeLambda"
    States = {
      InvokeLambda = {
        Type     = "Task"
        Resource = var.lambda_function_arn
        End      = true
      }
    }
  })
}