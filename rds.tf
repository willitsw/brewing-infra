# resource "aws_db_instance" "beer_db" {
#   allocated_storage    = 20
#   engine               = "postgres"
#   identifier           = "beer-db"     
#   engine_version       = "13"
#   instance_class       = "db.t4g.micro"
#   name                 = "beer_db"
#   username             = "dbuser"
#   password             = random_password.password.result
#   skip_final_snapshot  = true
#   publicly_accessible  = true
#   vpc_security_group_ids = [aws_security_group.beer_db_group.id]
# }

# resource "aws_security_group" "beer_db_group" {
#   name        = "beer_db_group"

#   ingress {
#     description      = "Local Access"
#     from_port        = 5432
#     to_port          = 5432
#     protocol         = "tcp"
#     cidr_blocks      = ["98.29.75.73/32"]
#   }
# }
