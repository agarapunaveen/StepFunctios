module "IAM" {
  source = "../../Modules/IAM"
}
module "Lambda" {
  source = "../../Modules/Lambda"
  lambda_role = module.IAM.lambda_role
}
module "stepfunction" {
  source = "../../Modules/Stepfunctions"
  step_role = module.IAM.step_role
  lambda_function_arn = module.Lambda.lambda_function_arn
}