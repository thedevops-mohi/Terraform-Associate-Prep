output "hello" {
  description = "Print hello world"
  value       = "Hello World"

}

output "vpc_id" {
  description = "print VPC ID"
  value       = aws_vpc.vpc.id


}


output "public_url" {
  description = "print public_url"
  value       = "https://${aws_instance.web.public_ip}:8080/index.html"


}


output "vpc_information" {
  description = "VPC Information about Environment"
  value       = "Your ${aws_vpc.vpc.tags.Environment}VPC has id ${aws_vpc.vpc.id}"

}