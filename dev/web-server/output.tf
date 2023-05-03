output "public_ip" {
    value = aws_instance.dev-web-srv-1.public_ip
    description = "The public IP address of the web server"
}
