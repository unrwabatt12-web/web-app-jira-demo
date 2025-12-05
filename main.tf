
# WEB-1: Update homepage styling
##########################################
# 1. Terraform Provider Configuration
##########################################
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

##########################################
# 2. Local Variable (Node.js App Code)
##########################################
locals {
  app_code = <<EOF
const http = require("http");

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Hello from Terraform Local Lab!");
});

server.listen(3000, () => {
  console.log("Server running on port 3000");
});
EOF
}

##########################################
# 3. Create index.js in webapp/src/
##########################################
resource "local_file" "webapp_app" {
  filename = "${path.module}/webapps/src/index.js"
  content  = local.app_code
}

##########################################
# 4. Output the File Path
##########################################
output "webapp_file_path" {
  value       = local_file.webapp_app.filename
  description = "The full path to the web application's index.js file."
}
