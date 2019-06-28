

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}


resource "aws_security_group" "reglasSeminario" {
  name        = "reglasSeminario"
  description = "Reglas seminario"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port   = 8082
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 65535
    protocol        = "udp"
    cidr_blocks     = ["0.0.0.0/0"]
  }


}



resource "aws_instance" "seminariotr" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name = "instancia1"
   security_groups = ["${aws_security_group.reglasSeminario.name}"]


  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin:/bin/sbin",
      "sudo echo 'Waiting for the network'",
      "sudo sleep 120",
      "sudo apt-get update",
      "sudo apt-get -y install docker.io",
      "sudo docker network create --subnet=172.18.0.0/16 redapp",
      "sudo docker run -it --net redapp --ip 172.18.0.10 --name webserver -d -p 80:80 jorged104/webserver",
      "sudo docker run -it --net redapp --ip 172.18.0.4 --name apiconsultas -d -p 8082:80 jorged104/apiconsultas",
      "sudo docker run -it --net redapp --ip 172.18.0.5 --name apiinsert -d -p 8083:80 jorged104/apiinsert",
      "sudo docker run -d --net redapp --ip 172.18.0.2 -p 3306:3306 -it --name database -e MYSQL_ROOT_PASSWORD=123456 jorged104/database --character-set-server=utf8mb4",
    ]
    connection {
      type     = "ssh"
      private_key = "${file("instancia1.pem")}"
      user     = "ubuntu"
      timeout  = "5m"
      host = "${aws_instance.seminariotr.public_ip}"
    }
  }

}

output "seminariotr" {
  value = "${aws_instance.seminariotr.public_ip}"
}

